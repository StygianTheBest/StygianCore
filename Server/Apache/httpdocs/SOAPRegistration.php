<?php

class SOAPRegistration
{
    protected $messages = Array();
    protected $db;
    protected $soap;
    protected $showForm = true;
    
    public function __construct()
    {
        try
        {
            $this -> dbConnect();
            if ($this -> validateInput())
            {
                $this -> soapConnect();
                $this -> showForm = false;
                $this -> soapCommand('account create '.$_POST["accountname"].' '.$_POST["password"]);
				$this -> soapCommand('account set gmlevel '.$_POST["accountname"].' 0 -1');
                $stmt = $this -> db -> prepare("UPDATE `account` SET `email` = ?, `expansion` = ? WHERE `username` = ?;");
                $stmt -> bind_param('sis', $_POST["email"], $_POST["expansion"], $_POST["accountname"]);
                $stmt -> execute();
            }
        }
        catch (Exception $e)
        {
            $this -> addMessage($e -> getMessage());
        }
    }
    
    protected function validateInput()
    {
        if (empty($_POST["accountname"]))
        {
            $this -> addMessage('Please fill in an account name.');
        }
        elseif (!preg_match('/^[a-z0-9]{5,32}$/i', $_POST["accountname"]))
        {
            $this -> addMessage('Your account name must be between 5 and 32 characters long and may only contain letters and numbers.');
        }
        else
        {
            $stmt = $this -> db -> prepare("SELECT `username` FROM `account` WHERE `username` = ?;");
            $stmt -> bind_param('s', $_POST["accountname"]);
            $stmt -> execute();
            $stmt -> store_result();
            if ($stmt->num_rows > 0)
            {
                $this -> addMessage('There is already an account with that name. Please use a different account name.');
            }
        }
        
        if (empty($_POST["password"]))
        {
            $this -> addMessage('Please fill in a password.');
        }
        else
        {
            if (!preg_match('/^[a-z0-9!"#$%]{3,6}$/i', $_POST["password"]))
            {
                $this -> addMessage('The password must be between 3 and 6 characters long and may only contain letters, numbers and the following special characters: !"#$%');
            }
            
            if (empty($_POST["password2"]))
            {
                $this -> addMessage('Please confirm your password.');
            }
            elseif ($_POST["password"] !== $_POST["password2"])
            {
                $this -> addMessage('The two passwords do not match.');
            }
        }
        
        if (empty($_POST["email"]))
        {
            $this -> addMessage('Please fill in an e-mail address.');
        }
        elseif (!filter_var($_POST["email"], FILTER_VALIDATE_EMAIL))
        {
            $this -> addMessage('You have entered an invalid e-mail address.');
        }
        elseif (strlen($_POST["email"]) > 254)
        {
            $this -> addMessage('The e-mail address can not be longer than 254 characters long.');
        }
        elseif (CHECK_FOR_DUPLICATE_EMAIL)
        {
            $stmt = $this -> db -> prepare("SELECT `email` FROM `account` WHERE `email` = ?;");
            $stmt -> bind_param('s', $_POST["email"]);
            $stmt -> execute();
            $stmt -> store_result();
            if ($stmt->num_rows > 0)
            {
                $this -> addMessage('There is already an account with that e-mail address. Please use a different e-mail.');
            }
        }
        
        if (!isset($_POST["expansion"]) || $_POST["expansion"] != intval($_POST["expansion"]) || intval($_POST["expansion"]) < 0 || intval($_POST["expansion"]) > 2)
        {
            $this -> addMessage('Please select your expansion.');
        }
        
        return empty($this -> messages);
    }
    
    protected function dbConnect()
    {
        $this -> db = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
        if (mysqli_connect_errno())
        {
            throw new Exception("Database connection failed: ". mysqli_connect_error());
        }
        return true;
    }
    
    protected function soapConnect()
    {
        $this -> soap = new SoapClient(NULL, Array(
            'location'=> 'http://'. SOAP_IP .':'. SOAP_PORT .'/',
            'uri' => 'urn:TC',
            'style' => SOAP_RPC,
            'login' => SOAP_USER,
            'password' => SOAP_PASS,
            'keep_alive' => false //keep_alive only works in php 5.4.
        ));
    }
    
    protected function soapCommand($command)
    {
        $result = $this -> soap -> executeCommand(new SoapParam($command, 'command'));
        $this -> addMessage($result);
        return true;
    }
    
    protected function addMessage($message)
    {
        $this -> messages[] = $message;
        return true;
    }
    
    public function getMessages()
    {
        return $this -> messages;
    }
    
    public function showForm()
    {
        return $this -> showForm;
    }
    
    public function __destruct()
    {
        $this -> db -> close();
    }
}