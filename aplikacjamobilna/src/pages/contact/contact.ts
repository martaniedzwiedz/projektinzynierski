import { Component } from '@angular/core';
import { NavController, App } from 'ionic-angular';
import { LoginPage } from '../login/login';
import { AuthServiceProvider } from '../../providers/auth-service/auth-service';

@Component({
  selector: 'page-contact',
  templateUrl: 'contact.html'
})
export class ContactPage {

  userDetails : any;
  responseData: any;
    dataSet: any;

  userPostData = {"user_id":"","token":""};

  constructor(public navCtrl: NavController, public app: App,public authService:AuthServiceProvider) {
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
update(){
  this.getPodajnik();
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


}
