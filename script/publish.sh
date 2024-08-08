ssh idev << EOF
cd /var/www/zafercetin.dev
rm -rf *
exit
EOF
scp -r /Users/zafercetin/Documents/goldcity_mobil/build/web/ idev:/var/www/zafercetin.dev
ssh idev << EOF
cd /var/www/zafercetin.dev/web
mv * ../
exit
EOF