import { Component } from '@angular/core';
import { IonicPage, NavController, ToastController } from 'ionic-angular';
import { TabsPage } from '../tabs/tabs';
import { SignupPage } from '../signup/signup';
import { AuthServiceProvider } from '../../providers/auth-service/auth-service';

/**
 * Generated class for the LoginPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-login',
  templateUrl: 'login.html',
})
export class LoginPage {

  responseData: any;
  userData = {"username": "","password": ""};

  constructor(public navCtrl: NavController, public authService:AuthServiceProvider, private toastCtrl:ToastController) {
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad LoginPage');
  }

  login() {
      if(this.userData.username && this.userData.password){
        this.authService.postData(this.userData, 'login').then((result)=>{
          this.responseData = result;
          console.log(this.responseData);
          if(this.responseData.userData){
            localStorage.setItem('userData', JSON.stringify(this.responseData));
            this.navCtrl.push(TabsPage);
          }
        else{
            this.presentToast("Nazwa bądź hasło jest nieprawidłowe")
        }
        }, (err) => {
      });
      }
      else{
        this.presentToast("Wypełnij wszystkie pola")
      }
  }

  presentToast(msg) {
    let toast = this.toastCtrl.create({
      message: msg,
      duration: 3000
    });
    toast.present();
  }

    signup() {
          this.navCtrl.push(SignupPage);
      }
}
