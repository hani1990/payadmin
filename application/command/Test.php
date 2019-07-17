<?php
namespace app\command;
/**
 * Created by PhpStorm.
 * User: mac
 * Date: 2019-07-17
 * Time: 09:11
 */
use think\console\Command;
use think\console\Input;
use think\console\Output;

class Test extends Command
{

    protected function configure()
    {
        $this->setName('test')->setDescription('Here is the remark ');
    }

    protected function execute(Input $input, Output $output)
    {

        $output->writeln("TestCommand:");
    }

}