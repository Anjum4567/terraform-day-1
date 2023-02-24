#How to Create AWS SSH Key 

resource "aws_key_pair" "key-tf" {
  key_name   = "key_tf" #this is the key name 
  public_key = " id_rsa.pub................................................key "

output "keyname" {
  value = aws_key_pair.key-tf.key_name
}




command to generate public and private key :
  ssh-keygen -t rsa
cat id_rsa
gedit id_rsa.pub 
