import { Component } from '@angular/core';
import { NavController, App, ToastController } from 'ionic-angular';
import { AuthServiceProvider } from '../../providers/auth-service/auth-service';
import { DetailsPage } from '../details/details';
import { AlertController } from 'ionic-angular';

@Component({
  selector: 'page-about',
  templateUrl: 'about.html'
})
export class AboutPage {

  userDetails : any;
  responseData: any;
    dataSet: any;

  userPostData = {"user_id":"","token":"","podajnik_id":"","podajniczek":""};

  constructor(public navCtrl: NavController, public app: App,public authService:AuthServiceProvider, public alertCtrl: AlertController, private toastCtrl:ToastController) {
    const data = JSON.parse(localStorage.getItem('userData'));
      this.userDetails = data.userData;
      this.userPostData.user_id = this.userDetails.user_id;
      this.userPostData.token = this.userDetails.token;
      this.getPodajnik();
  }


  backToWelcome(){
   const root = this.app.getRootNav();
   root.popToRoot();
}

logout(){
     localStorage.clear();
     setTimeout(() => this.backToWelcome(), 1000);
}

ustaw_dawke() {
      this.navCtrl.push(DetailsPage);
  }


  getPodajnik(){
    this
      .authService
      .postData(this.userPostData, "podajniki")
      .then((result)=>{
        this.responseData = result;
        this.dataSet = this.responseData.podajniki;
      },(err)=> {

      });
  }

  presentPrompt(podajniczek) {
  const alert = this.alertCtrl.create({
    title: 'Zmień nazwę',
    inputs: [
      {
        name: 'nazwakonia',
        placeholder: 'Nazwa'
      },
    ],
    buttons: [
      {
        text: 'Anuluj',
        role: 'cancel',
        handler: data => {
          console.log('Cancel clicked');
        }
      },
      {
        text: 'Zmień',
        handler: data => {

            this.userPostData.podajnik_id = data.nazwakonia;
            this.userPostData.podajniczek = podajniczek;
            //this.userPostData.podajnik_id = podajnik_id;
            this
                .authService
                .postData(this.userPostData,"zmienPodajnik")
               .then((result) => {
                this.responseData = result;
                this.getPodajnik();
              }, (err) => {
            });

        }
      }
    ]
  });
  alert.present();
}

presentPrompt1() {
const alert = this.alertCtrl.create({
  title: 'Podaj numer podajnika',
  inputs: [
    {
      name: 'nrpodajnika',
      placeholder: 'Numer podajnika'
    },
  ],
  buttons: [
    {
      text: 'Anuluj',
      role: 'cancel',
      handler: data => {
        console.log('Cancel clicked');
      }
    },
    {
      text: 'Dodaj',
      handler: data => {
          this.userPostData.podajnik_id = data.nrpodajnika;
          this
              .authService
              .postData(this.userPostData,"dodajPodajnik")
             .then((result) => {
              this.responseData = result;
                this.getPodajnik();
                console.log(this.responseData.podajnik_id);
              if(this.responseData.feedData.podajnik_id){

            }else{
              this.presentToast("Podany numer podajnika nie istnieje, bądź jest już zajęty")
            }
            }, (err) => {

          });
      }
    }
  ]
});
alert.present();
}

presentConfirm(podajnik_id, msgIndex) {
  let alert = this.alertCtrl.create({
    title: 'Usuń',
    message: 'Czy na pewno chcesz usunąć ten podajnik ze swojej stajni?',
    buttons: [
      {
        text: 'Anuluj',
        role: 'cancel',
        handler: () => {
          console.log('Cancel clicked');
        }
      },
      {
        text: 'Usuń',
        handler: () => {
          this.userPostData.podajnik_id = podajnik_id;
          this
              .authService
              .postData(this.userPostData,"usunPodajnik")
             .then((result) => {
              this.responseData = result;
              this.dataSet.splice(msgIndex, 1);
              this.getPodajnik();
            }, (err) => {
          });
        }
      }
    ]
  });
  alert.present();
}


presentToast(msg) {
  let toast = this.toastCtrl.create({
    message: msg,
    duration: 3000
  });
  toast.present();
}

}
