<?php

namespace App;

class Number
{
  public function encryptString($str)
  {
    if (!$prvKey = openssl_get_privatekey(\Storage::disk('local')->get('api_keys/private.key'))) die('Loading private key failed');

    openssl_sign($str, $signature, $prvKey, "sha1WithRSAEncryption");
    openssl_free_key($prvKey);

    // var_dump(['data' => $signature, 'encdata' => base64_encode($signature), 'str' => $str ]);
    return base64_encode($signature);
  }

  public function checkString($str, $signature)
  {
    if (!$pubKey = openssl_get_publickey(\Storage::disk('local')->get('api_keys/public.key'))) die('Loading public key failed');
    $signature = base64_decode($signature);
    $result = openssl_verify($str, $signature, $pubKey);
    openssl_free_key($pubKey);

    // if ($result == 1) {
    //   echo "{$str} - valid \n";
    // } elseif ($result == 0) {
    //   echo "{$str} - invalid \n";
    // } else {
    //   echo "{$str} - error: ".openssl_error_string() .' \n';
    // }
    return $result;
  }

  public function checkNumber($number)
  {
    $encripted_sign = $this->encryptString($number);
    $result = $this->checkString($number, $encripted_sign);
    if ($result == 1)
      return true;
    return false;
  }
}
