importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js");

firebase.initializeApp({
    apiKey: "AIzaSyA-okPckRFVoe6-NK0F1Dl_BJLEqNlwKLs",
    authDomain: "gold-city-9d670.firebaseapp.com",
    projectId: "gold-city-9d670",
    storageBucket: "gold-city-9d670.appspot.com",
    messagingSenderId: "941064344872",
    appId: "1:941064344872:web:0e20f65f93fd8254d36c1d",
    measurementId: "G-B9ZDD9T1LL"
});

const messaging = firebase.messaging();

messaging.onBackgroundMessage(function (payload) {
    console.log('Received background message ', payload);

    const notificationTitle = payload.notification.title;
    const notificationOptions = {
        body: payload.notification.body,
    };

    self.registration.showNotification(notificationTitle,
        notificationOptions);
});