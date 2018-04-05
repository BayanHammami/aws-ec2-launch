library(aws.ec2)
# Describe the AMI (from: http://www.louisaslett.com/RStudio_AMI/)
image <- "ami-b1b0c3c2"
describe_images(image)

# Check your VPC and Security Group settings
s <- describe_subnets()
g <- describe_sgroups()

# Launch the instance using appropriate settings
i <- run_instances(image = image, 
                   type = "t2.micro", # <- you might want to change this
                   subnet = s[[1]], 
                   sgroup = g[[1]])

# RStudio Server will be available at the "publicIp" address returned in `i`
# Note: the default security settings prohibit outbound traffic

# Stop and terminate the instances
stop_instances(i[[1]])
terminate_instances(i[[1]])