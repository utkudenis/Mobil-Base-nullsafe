import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'localization_helper.dart';

class DateTimeHelper {
  static DateTime getLocalDateFromUTCDate(DateTime date) {
    var today = DateTime.now();
    var offset = today.timeZoneOffset;
    var newDate = date.add(offset);
    var returnDate = new DateTime(newDate.year, newDate.month, newDate.day, newDate.hour, newDate.minute, newDate.second, newDate.millisecond);
    return returnDate;
  }

  static bool isSameMinute(DateTime date1, DateTime date2) {
    if (isSameHour(date1, date2) && date1.minute == date2.minute) {
      return true;
    } else {
      return false;
    }
  }

  static bool isSameHour(DateTime date1, DateTime date2) {
    if (isSameDate(date1, date2) && date1.hour == date2.hour) {
      return true;
    } else {
      return false;
    }
  }

  static bool isSameDate(DateTime date1, DateTime date2) {
    if (date1.year != date2.year || date1.month != date2.month || date1.day != date2.day) {
      return false;
    } else {
      return true;
    }
  }

  static bool isSameYear(DateTime date1, DateTime date2) {
    if (date1.year != date2.year) {
      return false;
    } else {
      return true;
    }
  }

  static bool isSameWeek(DateTime date1, DateTime date2) {
    /* 
      date1 ayın 15'i - perşembe = 4
 

      1. case
      date2 ayın 13'ü - salı = 2
 

      2. case
      date2 ayın 11'ü - pazar = 7


      var ilkTarih = date1 - weekday + 1 = bir hafta önceki pazartesi (12)
      var sonTarih = date1 + 7 - weekday = aynı hafta içindeki pazar (18)

      ilktarih <= date2 <= sontarih ? bu hafta : bu hafta değil

    */

    var newDate1 = new DateTime(date1.year, date1.month, date1.day, 0, 0, 0, 0);
    var newDate2 = new DateTime(date2.year, date2.month, date2.day, 0, 0, 0, 0);

    var firstDate = newDate1.add(Duration(days: -newDate1.weekday + 1));
    var lastDate = newDate1.add(Duration(days: 7 - newDate1.weekday));

    if (firstDate.compareTo(newDate2) <= 0 && lastDate.compareTo(newDate2) >= 0) {
      return true;
    } else {
      return false;
    }
  }

  static String getDateString(BuildContext context, DateTime utcDate, String language) {
    /**
     * eğer bildirimin oluşturulma saati bugün ile aynı günse saat olarak göster
     * bildirim saati ile şuanki saat farkı hesaplanıp kaç saat önce olduğu yazdırılacak.
     * değilse oluşturulma saati ile şuanki saat farkı 24 saatten fazlaysa dün yazdırıcak  değilse tarih olarak gösterilecek
     * eğer mesajın yaratılma tarıhı bugün ıse
     *    eğer saat farkı 0'dan farklı ise
     *        şu kadar saat önce
     *    eğer dakika farkı 0'dan farklı ise
     *        şu kadar dakika önce
     *    eğer dakika farkı 0 veya 0'dan az ise
     *        şimdi
     * 
    //  *    eğer aynı dakika içerisindeyse
    //  *      şimdi
    //  *    eğer aynı saat içerisindeyse 
    //  *      şu kadar dakika
    //  *    değilse
    //  *      şu kadar saat
     *            
     * dün ise
     *      dünü yazdır
     * 
     * aynı yıl ise 
     *      gün ve ay (MMM) olarak cinsinden yazdır
     * 
     * değılse
     *      gün ay (MMM) yıl olarak yazdır
     * 
     *            
   
     * 
    
     */
    final today = DateTime.now();
    final yesterday = today.add(Duration(days: -1));
    final localDate = getLocalDateFromUTCDate(utcDate);
    final String userLanguage = language.toLowerCase();

    if (isSameDate(localDate, today)) {
      final difference = today.difference(localDate);

      if (difference.inHours > 0) {
        if (difference.inHours == 1) {
          return localize(context, "hour_ago");
        } else {
          return difference.inHours.toString() + " " + localize(context, "hours_ago");
        }
      } else if (difference.inMinutes > 0) {
        if (difference.inMinutes == 1) {
          return localize(context, "minute_ago");
        } else {
          return difference.inMinutes.toString() + " " + localize(context, "minutes_ago");
        }
      } else {
        return localize(context, "now");
      }
    } else if (isSameDate(localDate, yesterday)) {
      return localize(context, 'Yesterday');
    } else if (isSameYear(localDate, today)) {
      var dateFormat = new DateFormat('d MMM', userLanguage);
      return dateFormat.format(localDate);
    } else {
      var dateFormat = new DateFormat('d MMMM yyyy', userLanguage);
      return dateFormat.format(localDate);
    }
  }
}
