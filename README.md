# docker_icon
![](https://github.com/tintucthethao/docker/blob/master/docker_icon.jpg)
# docker_flow
![](https://github.com/tintucthethao/docker/blob/master/docker_flow.png)

![Everything Is AWESOME](https://www.youtube.com/watch?v=StTqXEQ2l-Y "Everything Is AWESOME")

https://github.com/tintucthethao/docker/assets/64295974/33c40c86-017a-4e4e-89d3-5e381d22b68b


# docker
Đây là file docker config cho các dự án web của công ty
npm install laravel-mix --save-dev
php artisan passport:install
sudo chmod -R 777 public/assets/files/
composer require spatie/laravel-collection-macros
php artisan command:create-roles
php artisan command:create-permission-routes
php artisan db:seed --class=AdminsSeeder
//

# Dưới đây là hướng dẫn các bạn setup môi trường để chạy các dự án web của công ty
## Cấu trúc Makefile
```
|__ build (build docker images)
|__ stop ( Dừng docker containers)
|__ clean (Xóa toàn bộ docker containers)
|__ up (Khởi động docker containers)
|__ bash (Vào bash của docker container)
|__ permission (Cấp quyền cho thư mục storage)
|__ win :
|   |__ Tạo cert cho https
|   |__ build (build docker images)
|   |__ up (Khởi động docker containers)
|   |__ permission (Cấp quyền cho thư mục storage)
|__ linux :
    |__ Tạo cert cho https
    |__ build (build docker images)
    |__ up (Khởi động docker containers)
    |__ permission (Cấp quyền cho thư mục storage)
```
## Hướng dẫn cài đặt
### 1. Cài đặt docker
- Cài đặt docker cho windows: https://docs.docker.com/docker-for-windows/install/
- Cài đặt docker cho linux: https://docs.docker.com/engine/install/ubuntu/
### 2. Cài đặt docker-compose
- Cài đặt docker-compose cho windows: https://docs.docker.com/compose/install/
- Cài đặt docker-compose cho linux: https://docs.docker.com/compose/install/
### 3. Cài đặt make
- Cài đặt make cho windows: https://stackoverflow.com/questions/32127524/how-to-install-and-use-make-in-windows
- Cài đặt make cho linux: Thường thì linux đã có sẵn make

## Hướng dẫn sử dụng
- Copy thư mục docker vào thư mục chứa các dự án web của công ty
- Chạy lệnh sau:
```
make [OS] server=[Option]
```
Trong đó:
- [OS] là hệ điều hành của bạn, có thể là win hoặc linux
- [Option] là tùy chọn, có thể là apache hoặc nginx
- Ví dụ bạn dùng windows và muốn chạy apache thì chạy lệnh sau:
```
make win server=apache
```
- Ví dụ bạn dùng linux và muốn chạy nginx thì chạy lệnh sau:
```
make linux server=nginx
```

## Note
- Nếu bạn muốn thay đổi các thông số của docker container thì có thể vào file docker-compose.yml để chỉnh sửa
- Mặc định các phần được cài đặt bao gồm:
```
- nginx
- php-fpm
- mysql
- phpmyadmin
```
- Mặc định khi các bạn clone về thì các dự án web của công ty sẽ được chạy trên các port sau:
```
- 80 (http)
- 443 (https)
- 3306 (mysql)
- 9080 (phpmyadmin)
- 9000 (php-fpm) #Không nên thay đổi port này
```
Hãy chắc chắn rằng các port này không bị chiếm bởi các chương trình khác trên máy của bạn
- php-fpm là cần thiết khi bạn muốn dùng Nginx để chạy các dự án web của công ty
