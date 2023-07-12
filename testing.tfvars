region        = "eu-central-1"
instance_type = "t3.medium"

key_name = "KeyFromLinuxAWS-Frankfurt"


tags = {
  "Environment" = "Testing"
  "Owner"       = "I_am"
  "Proj"        = "Test_Kube_Spray"
  "terraform"   = "True"
}

node_count = 3