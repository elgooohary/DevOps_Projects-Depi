module "vpc" {
  source   = "./modules/vpc"
  vpc-cidr = var.vpc-cidr-block
  name     = "my-vpc"
}

module "public-subnet" {
  source              = "./modules/subnet"
  vpc-id              = module.vpc.id
  cidr-block          = var.public-subnet-cidr
  availability-zone   = var.public-availability-zone
  public-ip-on-launch = true # 
  name                = "public-subnet"
}

module "private-subnet" {
  source            = "./modules/subnet"
  vpc-id            = module.vpc.id
  cidr-block        = var.private-subnet-cidr
  availability-zone = var.private-availability-zone
   public-ip-on-launch = false # or true, depending on your requirements
  name              = "private-subnet"
}

module "igw" {
  source = "./modules/igw"
  vpc-id = module.vpc.id
  name   = "my-igw"
}

module "public-route-table" {
  source     = "./modules/route-table"
  vpc-id     = module.vpc.id
  cidr-block = "0.0.0.0/0"
  gateway-id = module.igw.id
  name       = "public-Rt"
  subnet-id  = module.public-subnet.id
}

module "private-route-table" {
  source     = "./modules/route-table"
  vpc-id     = module.vpc.id
  cidr-block = var.vpc-cidr-block
  gateway-id = "local"
  name       = "private-Rt"
  subnet-id  = module.private-subnet.id

}

module "bastion-sg" {
  source                = "./modules/sg"
  name                  = "bastion-sg"
  description           = "allow ssh"
  vpc-id                = module.vpc.id
  enable-ingress-rule-1 = true
  cidr-block-1            = "0.0.0.0/0"
  from-port-1           = 22
  ip-protocol           = "tcp"
  to-port-1             = 22

}

module "web-app-sg" {
  source                = "./modules/sg"
  name                  = "app-sg"
  description           = "allow ssh and port 3000"
  vpc-id                = module.vpc.id
  enable-ingress-rule-1 = true
  cidr-block-1          = "0.0.0.0/0"
  from-port-1           = 22
  ip-protocol           = "tcp"
  to-port-1             = 22


  enable-ingress-rule-2 = true
  cidr-block-2          = "0.0.0.0/0"
  from-port-2           = 3000
  to-port-2             = 3000
}


module "Bastion" {
  source            = "./modules/ec2"
  ami               = "ami-047d7c33f6e7b4bc4"
  # instance_type     = "t2.micro"
  subnet-id         = module.public-subnet.id
  sgs               = [ module.bastion-sg.id ] 
  availability-zone = var.public-availability-zone
  name              = "bastion-jumper_server"

}

module "web-app" {
  source            = "./modules/ec2"
  ami               = "ami-047d7c33f6e7b4bc4"
  # instance_type     = "t2.micro"
  subnet-id         = module.private-subnet.id
  sgs               = [module.web-app-sg.id]
  availability-zone = var.private-availability-zone
  name              = "web-app"
}

