
resource "aws_key_pair" "my_key" {
  key_name   = "satish_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC7xluJU8rfB9N9DUd9wGsA2JAr1EiIMHlHMqIwCyJO17sUr30RwMq8kYVF1++/ykdAAUw1WXGXyfDQzOM6r21A34S8GEtKwnL//jgI+YD/3uwGW7d7KawEdJDyEbTGVdEjrpeYzIBkii0EnVCohsLBXJJGz29ypovSu/XLKpl2q2VbsT+t+jYW6fM0MP4l24hn2Wh0o4HQfeUDlttNuqK+XwgP+eidnh+J5DulLaFeFTHDQf9meNUOSnATr/X+Xj6PW/DTpVr8KXQ86B8eNlpsWqkblGIF/7VLssgl+s2aLjr2aj1f7in2QdEYAviFhU8qOA3qWaTcIKfwwcMxT1dWvLNG80UN5DqqlCtS5neII3uhNIzWv4MLU+GVZHLAcZJhUkQciuQcHTrxteBDQlRBRHZ2qGAKWphCl+owYgEFgYAaB4yQAouzst5UKSUrYTrd64seiP/15W5qbRM2H0rIMR4QXJERH7mLIACVmMfjKWIj40S5poCik8H2M5zQNR6lEaFFlblIfvIWnShOwRoFXWwpw3lVf+dl1O0TfzAgeSaEfZ7BGS/QHqxxuN2Ex5OCJ4XVtCspgN4TRoAUR31oi2wCCSdGvRzWRKjzO8+nWrqapFZZGD6OpQQoT0VH/h20cjCRUbeVJJWIcw5UvPh7UpWAtjcy70UxI1InXYDtAQ== satish"
}

resource "aws_instance" "web" {
  count         = "${var.ec2_count}"
  ami           = "${var.ami_id}"
  key_name      = aws_key_pair.my_key.key_name
  instance_type = "${var.instance_type}"
  subnet_id     = "${var.subnet_id}"

  tags = {
    Name = "HelloWorld"
  }
}