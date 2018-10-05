import { Component } from '@angular/core';
import { NavController, App, ToastController } from 'ionic-angular';
import { AuthServiceProvider } from '../../providers/auth-service/auth-service';
import { AboutPage } from '../about/about';
import { AlertController } from 'ionic-angular';

/**
 * Generated class for the DetailsPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-details',
  templateUrl: 'details.html',
})
export class DetailsPage {

  userDetails : any;
  responseData: any;
    dataSet: any;

  userPostData = {"user_id":"","token":"","podajnik_id":"","podajniczek":"","wybor":""};

  constructor(public navCtrl: NavController, public app: App,public authService:AuthServiceProvider, public alertCtrl: AlertController, private toastCtrl:ToastController) {
    const data = JSON.parse(localStorage.getItem('userData'));
      this.userDetails = data.userData;
      this.userPostData.user_id = this.userDetails.user_id;
      this.userPostData.token = this.userDetails.token;
      //this.getPodajnik();
  }

  f(dawka1, wart){
  console.log('Value Changed!');
  console.log(dawka1);
  console.log(wart);

    this.userPostData.podajniczek = dawka1;
    this.userPostData.wybor = wart;
    this.userPostData.podajnik_id = "5";
  this
      .authService
      .postData(this.userPostData,"ustawJedzonko")
     .then((result) => {
      this.responseData = result;
    }, (err) => {
  });
  }


  ionViewDidLoad() {
    console.log('ionViewDidLoad DetailsPage');
  }

  backToWelcome(){
   const root = this.app.getRootNav();
   root.popToRoot();
}

logout(){
     localStorage.clear();
     setTimeout(() => this.backToWelcome(), 1000);
}

  back() {
        this.navCtrl.push(AboutPage);
    }
}
