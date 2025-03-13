variable "project"{
    default= "expense"
}

variable "environment"{

}

variable "instances"{
    default= ["mysql","frontend","backend"]
}