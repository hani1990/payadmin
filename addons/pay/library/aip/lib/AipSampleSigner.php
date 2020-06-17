<?php

namespace addons\pay\library\aip\lib;


class AipSampleSigner
{

    const BCE_AUTH_VERSION = "bce-auth-v1";
    const BCE_PREFIX = 'x-bce-';

    //不指定headersToSign情况下，默认签名http头，包括：
    //    1.host
    //    2.content-length
    //    3.content-type
    //    4.content-md5
    public static $defaultHeadersToSign;

    public static function __init()
    {
        AipSampleSigner::$defaultHeadersToSign = array(
            "host",
            "content-length",
            "content-type",
            "content-md5",
        );
    }

    /**
     * 签名
     * @param  array $credentials
     * @param  string $httpMethod
     * @param  string $path
     * @param  array $headers
     * @param  string $params
     * @param  array $options
     * @return string
     */
    public static function sign(
        array $credentials,
        $httpMethod,
        $path,
        $headers,
        $params,
        $options = array()
    )
    {
        //设定签名有效时间
        if (!isset($options[AipSignOption::EXPIRATION_IN_SECONDS])) {
            //默认值1800秒
            $expirationInSeconds = AipSignOption::DEFAULT_EXPIRATION_IN_SECONDS;
        } else {
            $expirationInSeconds = $options[AipSignOption::EXPIRATION_IN_SECONDS];
        }

        //解析ak sk
        $accessKeyId = $credentials['ak'];
        $secretAccessKey = $credentials['sk'];

        //设定时间戳，注意：如果自行指定时间戳需要为UTC时间
        if (!isset($options[AipSignOption::TIMESTAMP])) {
            //默认值当前时间
            $timestamp = gmdate('Y-m-d\TH:i:s\Z');
        } else {
            $timestamp = $options[AipSignOption::TIMESTAMP];
        }

        //生成authString
        $authString = AipSampleSigner::BCE_AUTH_VERSION . '/' . $accessKeyId . '/'
            . $timestamp . '/' . $expirationInSeconds;

        //使用sk和authString生成signKey
        $signingKey = hash_hmac('sha256', $authString, $secretAccessKey);

        //生成标准化URI
        $canonicalURI = AipHttpUtil::getCanonicalURIPath($path);

        //生成标准化QueryString
        $canonicalQueryString = AipHttpUtil::getCanonicalQueryString($params);

        //填充headersToSign，也就是指明哪些header参与签名
        $headersToSign = null;
        if (isset($options[AipSignOption::HEADERS_TO_SIGN])) {
            $headersToSign = $options[AipSignOption::HEADERS_TO_SIGN];
        }

        //生成标准化header
        $canonicalHeader = AipHttpUtil::getCanonicalHeaders(
            AipSampleSigner::getHeadersToSign($headers, $headersToSign)
        );

        //整理headersToSign，以';'号连接
        $signedHeaders = '';
        if ($headersToSign !== null) {
            $signedHeaders = strtolower(
                trim(implode(";", $headersToSign))
            );
        }

        //组成标准请求串
        $canonicalRequest = "$httpMethod\n$canonicalURI\n"
            . "$canonicalQueryString\n$canonicalHeader";

        //使用signKey和标准请求串完成签名
        $signature = hash_hmac('sha256', $canonicalRequest, $signingKey);

        //组成最终签名串
        $authorizationHeader = "$authString/$signedHeaders/$signature";

        return $authorizationHeader;
    }

    /**
     * 根据headsToSign过滤应该参与签名的header
     * @param  array $headers
     * @param  array $headersToSign
     * @return array
     */
    public static function getHeadersToSign($headers, $headersToSign)
    {

        //value被trim后为空串的header不参与签名
        $filter_empty = function ($v) {
            return trim((string)$v) !== '';
        };
        $headers = array_filter($headers, $filter_empty);

        //处理headers的key：去掉前后的空白并转化成小写
        $trim_and_lower = function ($str) {
            return strtolower(trim($str));
        };
        $temp = array();
        $process_keys = function ($k, $v) use (&$temp, $trim_and_lower) {
            $temp[$trim_and_lower($k)] = $v;
        };
        array_map($process_keys, array_keys($headers), $headers);
        $headers = $temp;

        //取出headers的key以备用
        $header_keys = array_keys($headers);

        $filtered_keys = null;
        if ($headersToSign !== null) {
            //如果有headersToSign，则根据headersToSign过滤

            //预处理headersToSign：去掉前后的空白并转化成小写
            $headersToSign = array_map($trim_and_lower, $headersToSign);

            //只选取在headersToSign里面的header
            $filtered_keys = array_intersect_key($header_keys, $headersToSign);

        } else {
            //如果没有headersToSign，则根据默认规则来选取headers
            $filter_by_default = function ($k) {
                return AipSampleSigner::isDefaultHeaderToSign($k);
            };
            $filtered_keys = array_filter($header_keys, $filter_by_default);
        }

        //返回需要参与签名的header
        return array_intersect_key($headers, array_flip($filtered_keys));
    }

    /**
     * 检查header是不是默认参加签名的：
     * 1.是host、content-type、content-md5、content-length之一
     * 2.以x-bce开头
     * @param  array $header
     * @return boolean
     */
    public static function isDefaultHeaderToSign($header)
    {
        $header = strtolower(trim($header));
        if (in_array($header, AipSampleSigner::$defaultHeadersToSign)) {
            return true;
        }
        return substr_compare($header, AipSampleSigner::BCE_PREFIX, 0, strlen(AipSampleSigner::BCE_PREFIX)) == 0;
    }
}

AipSampleSigner::__init();