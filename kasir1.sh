#!/bin/bash
#ProgramKasirSederhana
#kasir1.sh

#Display Menu (Menampilkan menu yang tersedia)
echo    #printah untuk menampilkan pesan
echo "=== Menu Warung Lly ==="
echo "1. Cireng Isi		: Rp.10.000"
echo "2. Cireng Kuah Keju	: Rp.15.000"
echo "3. Pisang Krispi	: Rp.12.000"
echo "4. Roti Bakar		: Rp.10.000"
echo "5. Teh Manis		: Rp.6.000"
echo "6. Kopi Susu		: Rp.15.000"
echo "======================="

#Input untuk menanyakan jumlah item yang dibeli
echo
echo -n "Berapa item yang ingin dibeli: " #Perintah untuk menampilkan pesan dengan -n untuk menonaktifkan baris baru pada echo
read jumlah_item  #read akan membaca input dari pengguna kemudian akan menyimpannya di variabel jumlah_item
total=0    #total=0 berfungsi sebagai perintah untuk mendeklarasikan dan menginisialisasi variabel total dengan nilai awal 0
	   #jadi ketika menambahkan harga menu yang akan ditambahkan ke variabel total dimulai dari 0 baru ditambahkan dengan subtotal dari item

#loop for do done yang digunakan untuk setiap item yang akan ditambahkan 
for ((i=1; i<=jumlah_item; i++))   #loop for yang mana (i=1) menunjukkan variabel i dideklarasikan dan diatur ke nilai 1, maksudnya iterasi akan dimulai dari
				   #indeks 1. (i<=jumlah_item) artinya loop akan terus berjalan selama nilai i kurang dari atau sama dengan nilai variabel.
				   #jumlah_item. (i++) maksudnya sesudah satu iterasi selesai maka loop akan berpindah ke item selanjutnya. 
do
	echo
	echo -n "Item ke-$i: "     #echo memanggil variabel i 
	echo -n "Pilih menu (1-6) : "
	read menu
	echo -n "Jumlah porsi : "
	read porsi
 
	#Kontruksi Case-Esac untuk menghitung subtotal dari setiap item yang dipilih
#kontruksi case-esac dipilih karena menurut saya kontruksi ini lebih sederhana dibanding if-else (if-else menurut saya lebiih kompleks dan rawan error) 	
	case $menu in      #$menu berfungsi sebagai ekspresi yang nantinya ekspresi ini akan dievaluasi dan dibandingkan dengan pola secara berurutan
			   #ekspresi ini diambil dari variabel menu, dan apabila ada kecocokan antara ekspresi dengan pola, maka perintah akan dieksekusi
			    
		1) subtotal=$((porsi * 10000));;     #ini merupakan pola ke satu [1] yang mana apabila ekpresi juga bernilai 1 maka perintah akan dieksekusi 
		2) subtotal=$((porsi * 15000));;     #Ini merupakan pola kedua [2]
		3) subtotal=$((porsi * 12000));;     #ini merupakan pola ketiga [3]
		4) subtotal=$((porsi * 10000));;     #ini merupakan pola keempat [4]
		5) subtotal=$((porsi * 6000));;      #ini merupakan pola kelima [5]
		6) subtotal=$((porsi * 15000));;     #ini merupakan pola keenam [6]
		*) echo "Menu tidak tersedia";;      #kalau yang ini merupakan pola default yang akan dieksekusi apabila tidak ada pola lain yang cocok

	esac     #menutup kontruksi case

	echo "Subtotal: Rp$subtotal"  #Perintah ini akan menampilkan subtotal dari item yang dipilih pengguna dengan cara memanggil variabel subtotal
	total=$((total + subtotal))     #tanda dalam kurung ganda menunjukan penugasan dengan ekspansi aritmatika, yang didalamnya akan mengoperaasikan
					#penjumlahan antara total (total akumulatif sebelumnya) dengan subtotal (biaya item yang dipilih)
					#yang akan disimpan di vaariabel total
	echo
done

echo "Total belanja: Rp$total"         #menampilkan total belanja dengan memanggil variabel total

echo -n "Masukkan jumlah uang: "       #Meminta input jumlah uang
read bayar                             #Menyimpan hasil input di variabel bayar

if [ $bayar -ge $total ]; then         #kondisi apabila jumlah uang (bayar) lebih besar daripada total belanja (total), maka blok then akan dieksekusi
	kembalian=$((bayar - total))    #di variabel ini, variabel bayar dan total akan dioperasikan dengan operator penjumlahan untuk menghasilkan jumlah
					 #kembalian yang akan diterima pembeli, dan hasilnya akan disimpan di variabel kembalian 
	echo "Kembalian: Rp$kembalian"   #variabel kembalian dipanggil untuk menampilkan jumlah kembalian yang diterima pengguna
	echo -e "Terima kasih telah berbelanja"
	echo -e "Sampai Jumpa Lagi"
	echo
else
	echo "Uang tidak cukup"
fi
