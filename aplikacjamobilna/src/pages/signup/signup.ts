import { Component } from '@angular/core';
import { IonicPage, NavController,ToastController } from 'ionic-angular';
import { TabsPage } from '../tabs/tabs';
import { LoginPage } from '../login/login';
import { AuthServiceProvider } from '../../providers/auth-service/auth-service';
/**
 * Generated class for the SignupPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-signup',
  templateUrl: 'signup.html',
})
export class SignupPage {

  responseData: any;
  userData = {"username": "","password": "", "email": "", "name": ""};

  constructor(public navCtrl: NavController, public authService:AuthServiceProvider, public toastCtrl:ToastController ) {
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad SignupPage');
  }

  signup(){
    if(this.userData.username && this.userData.password && this.userData.name && this.userData.email){
      this.authService.postData(this.userData, 'signup').then((result)=>{
        this.responseData = result;
        console.log(this.responseData);
        localStorage.setItem('userData', JSON.stringify(this.responseData));
        this.navCtrl.push(TabsPage);
      }, (err) => {
      });
    }
else{
this.presentToast("Wypełnij wszystkie pola");
}
}

presentToast(msg) {
  let toast = this.toastCtrl.create({
    message: msg,
    duration: 3000
  });
  toast.present();
}

    back() {
          this.navCtrl.push(LoginPage);
      }

}
