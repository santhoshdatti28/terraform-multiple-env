resource "aws_instance" "this"{
    count= length(var.instances)
    ami = "ami-09c813fb71547fc4f"
    vpc_security_group_ids= [aws_security_group.demo-sg.id]
    instance_type= "t3.micro"
    tags={
        Name= "${var.project}-${var.environment}-${var.instances[count.index]}"
    }
}

resource "aws_security_group" "demo-sg" {
    name= "${var.project}-${var.environment}"
    description= "allow both inbound and outbound traffic"
    ingress{
        from_port= 22
        to_port= 22
        protocol= "tcp"
        cidr_blocks= ["0.0.0.0/0"]
    }
    egress{
        from_port= 0
        to_port= 0
        protocol= "-1"
        cidr_blocks= ["0.0.0.0/0"]
    }
    tags={
        Name= "${var.project}-${var.environment}"
    }
}

