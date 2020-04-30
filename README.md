
# kafka-on-aws
Deployment scripts to deploy Kafka Confluent suite on AWS EC2.

### Used versions
* Terraform v0.12.24
* ansible 2.9.7

### Terraform

    > Update your ~/.aws/credentials
    > Create an EC2 KeyPair
    > cd terraform
    > terraform init
    > terraform plan -out plan.json
    > terraform apply 'plan.json'

* gateway.tf → Internet Gateway creation.
* instances.tf → Instances to be created.
* subnet.tf → Subnet creation. For this example, I am using a public subnet
* route.tf → Route table information
* security_group.tf → Security group settings to allow for necessary network traffic into the instances.
* vpc.tf → VPC creation
* variables.tf contain the parameters for our terraform. It will create:
  * “rest” = X instances for Confluent REST API service
  * “connect” = X instances for Confluent Kafka Connect service
  * “ksql” = X instances for Confluent Ksql service
  * “schema” = X instances for Confluent Kafka Schema Registry service
  * “control_center” = X instances for Confluent Control Center (lighweight monitoring)
  * “broker” = X instances for Kafka brokers
  * “zookeeper” = X instances for Zookeeper nodes
  * With a prefix “staging”
  * Intance Type “t2.small” (by default, can be changed in your.tfvars)
 
### Ansible
* Update hosts.yml with your public DNS created instances
* Test you can SSH your machines and run the playbook

    > ansible -i hosts.yml all -m ping 
    > ansible-playbook -i hosts.yml all.yml

### Test
* Try to ssh one of your Kafka machine and check status of your cluster. For example: /usr/bin/kafka-topics --bootstrap-server localhost:9092 --list
