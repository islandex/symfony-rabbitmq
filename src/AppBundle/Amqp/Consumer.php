<?php
declare(strict_types=1);

namespace AppBundle\Amqp;

use OldSound\RabbitMqBundle\RabbitMq\ConsumerInterface;
use PhpAmqpLib\Message\AMQPMessage;

class Consumer implements ConsumerInterface
{
    /**
     * @param AMQPMessage $msg The message
     * @return mixed false to reject and requeue, any other value to acknowledge
     */
    public function execute(AMQPMessage $msg)
    {
        try {
            $data = json_decode($msg->body);
        } catch (\Exception $e) {

        }

        return true;
    }
}
