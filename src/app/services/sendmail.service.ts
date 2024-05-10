import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Order } from '../common/Order';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class SendmailService {

  url = environment.apiURL + '/api/send-mail'

  constructor(private httpClient: HttpClient) { }

  sendMailOrder(order:Order) {
    return this.httpClient.post(this.url+'/order', order);
  }

  sendMailOtp(email:String) {
    return this.httpClient.post(this.url+'/otp', email);
  }

  sendMailOtpForgotPassword(email:String) {
    return this.httpClient.post(this.url+'/otp-forgot-password', email);
  }

}
