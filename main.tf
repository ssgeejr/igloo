provider "aws" {
	region = var.aws_region
}

module "igloo_module" {
        source = "./igloo_modules/instance"
        ami = "ami-0ddf7dfd13a83d8c8"   #debian 12
        instance_type = "t2.nano"
        instance_name = "iglootf"
}