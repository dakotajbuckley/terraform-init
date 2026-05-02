resource "local_file" "test" {
    filename = "C:\\Users\\stati\\Desktop\\repos\\hi.txt"
    content = "Whats up ${random_pet.my-pet.id}"
}

resource "random_pet" "my-pet" {
    length = 2
    separator = "."
    prefix = "mr"
}