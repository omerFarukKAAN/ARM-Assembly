	AREA ornek,CODE,READONLY
	
	ENTRY
	
	MOV R0,#13
	LDR R1,=array 	;dizi baslangic adresi
	MOV R5,#0 		;dizi indeksi
	LDR R8,[R1,R5] 	;dizi ilk elemani
	MOV R2,#0 		;satir toplami
	MOV R4,#0 		;dizi dongu sayaci
	MOV R6,#0 		;dizi boyutu
	MOV R3,#0 		;en buyuk satir toplami
	MOV R7,#0 		;negatif sayi adedi
	
islem
	CMP R6,#26 		;dizi bitme kontrolu
	BEQ EXIT
	CMP R4,#5 		;satir bitme kontrolu
	BEQ satirAtla
	ADD R2,R2,R8 	;toplama islemi
	CMP R8,#0 		;negatif sayi kontrol
	BLE negatif
	CMP R8,R0 		;R0 kaydedicisindeki sayiyi dizide kontrol
	BEQ arananBulundu
	B islemDevam 	;pozitifse devam etme

islemDevam
	ADD R5,R5,#4 	;indeks artirma
	LDR R8,[R1,R5] 	;dizinin bir sonraki elemanina erisme
	ADD R4,R4,#1 	;dizi dongu artirma
	ADD R6,R6,#1 	;dizi boyut artirma
	B islem
	
negatif
	ADD R7,#1 		;negatif sayi adetini artirma
	CMP R8,R0		;R0 kaydedicisindeki sayiyi dizide kontrol
	BEQ arananBulundu
	B islemDevam
	
arananBulundu
	MOV R9,R6 		;R0 kaydedicisindeki sayi dizide varsa indeksini tutma
	B islemDevam
		
satirAtla
	MOV R4,#0 		;satirbasi
	CMP R2,R3 		;bir onceki satir toplami ile su ankini kiyaslama
	BGE degistir
	B islem
	
degistir
	MOV R3,R2 		;toplami buyuk olan satiri tutma
	MOV R2,#0
	B islem
	
EXIT B EXIT 		;cikis

array DCD 1,2,3,4,5
	  DCD 6,-7,8,9,10
	  DCD 11,12,13,-14,15
	  DCD 16,17,-18,19,20
	  DCD 21,22,23,24,-25
		  
	END
	
	
	
	
	