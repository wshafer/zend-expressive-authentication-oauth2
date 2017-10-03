<?php
/**
 * @see       https://github.com/zendframework/zend-expressive-authentication-oauth2 for the canonical source repository
 * @copyright Copyright (c) 2017 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   https://github.com/zendframework/zend-expressive-authentication-oauth2/blob/master/LICENSE.md New BSD License
 */

namespace Zend\Expressive\Authentication\OAuth2;

use League\OAuth2\Server\ResourceServer;
use Psr\Container\ContainerInterface;
use Zend\Expressive\Authentication\OAuth2\Exception;

class OAuth2AdapterFactory
{
    public function __invoke(ContainerInterface $container): PhpSession
    {
        $resourceServer = $container->has(ResourceServer::class) ?
                          $container->get(ResourceServer::class) :
                          null;
        if (null === $resourceServer) {
            throw new Exception\InvalidConfigException(
                'OAuth2 resource server is missing for authentication'
            );
        }
        $config = $container->get('config')['authentication']['oauth2'] ?? [];
        if (!isset($config['...'])) {
            throw new Exception\InvalidConfigException(
                'The ... configuration is missing for authentication'
            );
        }
        return new OAuth2Adapter($resourceServer, $config);
    }
}