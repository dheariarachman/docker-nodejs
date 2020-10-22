# Ambil docker image dari docker hub
# pada kasus kali ini, saya ambil node dengan tag 14.14.0
# dari official docker
FROM node:latest

# buat folder untuk menyimpan project
RUN mkdir -p /usr/src/app

# Buat lokasi kerja / workdir
# pada image
WORKDIR /usr/src/app

# copy package.json dan package-lock.json
# ke folder pada image docker
COPY package*.json ./

# lakukan perintah untuk install dependencies
RUN npm install

# lakukan perintah untuk build project
# ke mode production
# RUN npm ci --only=production

# Copy semua code yang ada pada local storage
# ke docker image storage
COPY . .

# masukan port untuk dapat akses
# ke dalam aplikasi nodejs
EXPOSE 3000

# command untuk menjalankan server nodejs
CMD [ "node", "index.js"]
