data "aws_ami" "dev-webservers" {
    most_recent = true
    owners = ["amazon"]
    
    tags = {
        Name = "dev-webservers-ami-latest"
        Tested = "true"
    
    }       
}