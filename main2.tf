#How to Create AWS SSH Key 

resource "aws_key_pair" "key-tf" {key_tf
  key_name   = "key_tf"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCsEVYq36EaJci3jTwdeABgI0jnFHy8oiipN28HXX93eQwMMNeW+A8OWta31g5Z7Ek+TJowqMf6X6EmR40GzYPEQ8u5pVN/wAUJAyBr4fv8YsmNB3XzBXjuJs6GcixEWpZvKRYoXy1/wvJoTFK63mTLut7PvEjvVutzNxLjJUqhwOnXw6quJNIPOL0xG2w1fzjbVp7mUp/F5Jyn4DNlKC8rjm1d0ZL9RZ0eALA+8ASSCmqi0a9WFxl1jR6jFrZh47AB3jIcEJhc0ycToq3qh4oHQldru5aAxVw8D+acwGbacOD/cYwrNKMSss6yjV47H0/ZD9UBs2zq3IT5ZJqjL7a2Jrur+ku/ryBsxwgkinUsmq/6Vb7LAfemQPeDVkTYBw7x+Fn/lKQtFNLMJiIK5+EtP6ye6OMS4SH+H13L1cIaIecImjylFY/BzYR6HLbZUqgZmzbiK6GqBTjXul1ZOk8GAW6wDcv9CiIYLxjYv+4c/ZwN7o2iICHxu8andlqnXys= anjum@master"
}

output "keyname" {
  value = aws_key_pair.key-tf.key_name
}
