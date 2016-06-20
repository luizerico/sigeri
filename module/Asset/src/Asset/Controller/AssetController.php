<?php
namespace Asset\Controller;
//define('$this->title', 'Asset');
//define('$this->route', 'asset');
//define('$this->entity', 'Asset\Entity\Asset');
use Asset\Entity\Asset;
use Asset\Controller\GenericController;
use Zend\Ldap\Ldap as Ldap;
use Exception;
class AssetController extends GenericController {
    public function __construct() {
        $this->object = new Asset();
        $this->entity = 'Asset\Entity\Asset';
        $this->title = 'Asset';
        $this->route = 'asset';
        parent::__construct();
    }
    public function reportsAction() {
                
    }
    public function execJSON($uri, $query, $method, $auth) {
        try {
            $post = array('jsonrpc' => '2.0',
                'method' => $method,
                'params' => $query,
                'auth' => $auth,
                'id' => 1
            );
            $data = json_encode($post);
            $curlStr = "/usr/bin/curl -X POST -d '$data' -H 'Content-Type: application/json' '$uri'";
            $execCurl = exec($curlStr);
            $curlOutput = json_decode($execCurl);
            return $curlOutput->result;
        } catch (Exception $e) {
            echo "Exception: ", $e->getMessage(), "\n";
        }
    }
    public function zabbixAction() {
        $uri = "http://zabbix.domain.com.br/api_jsonrpc.php";
        $username = "zabbix";
        $password = "zabbix";
        $return = array();
        $ORMRepository = $this->getEntityManager();
        $auth = $this->execJSON($uri, array(
            'user' => $username,
            'password' => $password), 'user.login', '');
        if (strlen($auth) === 32) {
            $query = array(
                'output' => 'extend',
                'sortfield' => 'host',
                    //'selectInventory' => 'true',
            );
            $output = $this->execJSON($uri, $query, 'host.get', $auth);
            foreach ($output as $host) {
                $dbArray = $ORMRepository->getRepository($this->entity)->findBy(array('name' => $host->name));
                if (!$dbArray) {
                    array_push($return, array('asset' => $host->name, 'exist' => 'false'));
                } else {
                    array_push($return, array('asset' => $host->name, 'exist' => 'true'));
                }
            }
            return array(
                'return' => $return
            );
        }
    }
    public function ldapAction() {
        $return = array();
        $options = array(
            'host' => 'ldap.domain.com.br',
            'username' => 'cn=admin,dc=domain,dc=com,dc=br',
            'password' => 'password',
            'bindRequiresDn' => true,
            'accountDomainName' => 'domain.com.br',
            'baseDn' => 'dc=matriz,dc=domain,dc=com,dc=br'
        );
        $ldap = new Ldap($options);
        $result = $ldap->search('(objectclass=*)', 'ou=maquinas,dc=matriz,dc=domain,dc=com,dc=br', Ldap::SEARCH_SCOPE_ONE);
//        foreach ($result as $node) {
//            echo $node['cn'][0] . " - " . $node['description'][0] . "<br/>";
//        }
//        $ldap->bind();
//        $ri = new RecursiveIteratorIterator($ldap->getBaseNode(), RecursiveIteratorIterator::SELF_FIRST);
//        foreach ($ri as $rdn => $n) {
//            var_dump($n);
//        }
        $ORMRepository = $this->getEntityManager();
        foreach ($result as $host) {
            $dbArray = $ORMRepository->getRepository($this->entity)->findBy(array('name' => $host['cn'][0]));
            if (!$dbArray) {
                array_push($return, array(
                    'asset' => $host['cn'][0],
                    'descr' => $host['description'][0],
                    'exist' => 'false'));
            } else {
                array_push($return, array(
                    'asset' => $host['cn'][0],
                    'descr' => $host['description'][0],
                    'exist' => 'true'));
            }
        }
        return array(
            'return' => $return
        );
    }
    public function updateAssetAction() {
        
    }
}
