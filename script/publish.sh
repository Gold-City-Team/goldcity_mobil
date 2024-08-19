cd ..
flutter build web --web-renderer html --release
ssh root@167.86.75.254 << EOF
cd /zafercetin
rm -rf *
exit
EOF
scp -r /Users/zafercetin/Documents/goldcity_mobil/build/web/ root@167.86.75.254:/zafercetin
ssh root@167.86.75.254 << EOF
cd /zafercetin/web
mv * ../
exit
EOF