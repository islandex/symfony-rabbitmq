<?php
declare(strict_types=1);

namespace AppBundle\CliCommand;

use OldSound\RabbitMqBundle\RabbitMq\ProducerInterface;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;

class RabbitMqCommand extends Command
{
    /** @var ProducerInterface */
    private $producer;

    public function __construct(ProducerInterface $producer)
    {
        $this->producer = $producer;
        parent::__construct();
    }

    protected function configure()
    {
        $this
            ->setName('rabbit:publish')
            ->setDescription('Publish data to a rabbit queue');
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {

        $output->writeln('Command executed successfully.');
    }
}