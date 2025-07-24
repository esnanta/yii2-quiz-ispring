/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/* READ ME
 * 
 * DOKUMENTASI MASALAH ADA DI MODEL
 */


//http://jsfiddle.net/kY98p/10/
$(document).ready(function () {

    $("[id^=accountpayable-]").change(function () {
        calculate();
    });

    $(document).on("change", "[id^=accountpayabledetail-]" ,function() {
       calculate();
    });

    $(document).on("click", "[id^=accountpayable-detail-del-btn]" , function(){
        calculate();
    });

//    $(document).on("click", "a", function(){
//        alert("A link was clicked!");
//    });
//    SISAKAN SEBAGAI CONTOH
//    $("#accountpayable-payment").change(function () {
//        calculate();
//    });


    //https://stackoverflow.com/questions/33159354/how-do-i-find-the-decimal-separator-for-current-locale-in-javascript
    //separator type = "decimal" or "group"
    function getSeparator(locale, separatorType) {
        const numberWithGroupAndDecimalSeparator = 1000.1;
        return Intl.NumberFormat(locale)
            .formatToParts(numberWithGroupAndDecimalSeparator)
            .find(part => part.type === separatorType)
            .value;
    }


    function calculate(){
        //https://stackoverflow.com/questions/60175384/how-to-add-thousand-separator-to-a-string-with-js-or-jquery-in-this-particular-f
        //CHECK FORMATTER IN MAIN CONFIG.
        const id_formatter = new Intl.NumberFormat(
                'id-ID', { maximumSignificantDigits: 8, maximumFractionDigits: 3 }
        );

        thousandSeparator = getSeparator('id-ID','group');
        //console.log('thousand separator : '+thousandSeparator)
        if(thousandSeparator=='.'){
            thousandSeparator = /\./g;
        }
        
        totalClaim = 0;

        for(i=0; i < 30; i++){
            if($('#accountpayabledetail-' + i + '-amount-disp').length > 0 ) {

                //HILANGKAN GRUP SEPARATOR
                detailAmount  = +$('#accountpayabledetail-' + i + '-amount-disp').val().replace(thousandSeparator, "");

                //HITUNG AKUMULASI TOTAL DETAIL
                totalClaim = totalClaim + detailAmount;

                //GRUP SEPARATOR DIATUR OLEH KARTIK DI FORM
                $('#accountpayabledetail-' + i + '-amount-disp').val(detailAmount);
            }
        }

        //HILANGKAN GRUP SEPARATOR SEBELUM DIHITUNG
        claim       = +$('#accountpayable-claim').val().replace(thousandSeparator, "");
        surcharge   = +$('#accountpayable-surcharge-disp').val().replace(thousandSeparator, "");
        penalty     = +$('#accountpayable-penalty-disp').val().replace(thousandSeparator, "");
        discount    = +$('#accountpayable-discount_nominal-disp').val().replace(thousandSeparator, "");
        payment     = +$('#accountpayable-payment-disp').val().replace(thousandSeparator, "");

        //HITUNG TOTAL & BALANCE
        claim       = totalClaim;
        total       = claim + surcharge + penalty;
        balance     = payment-(total-discount);
        
        
        $('#accountpayable-claim').val(id_formatter.format(claim));
        $('#accountpayable-surcharge-disp').val(surcharge); //GRUP SEPARATOR DIATUR OLEH KARTIK DI FORM
        $('#accountpayable-penalty-disp').val(penalty); //GRUP SEPARATOR DIATUR OLEH KARTIK DI FORM
        $('#accountpayable-total').val(id_formatter.format(total));
        $('#accountpayable-discount_nominal-disp').val(discount);//GRUP SEPARATOR DIATUR OLEH KARTIK DI FORM
        $('#accountpayable-payment-disp').val(payment);//GRUP SEPARATOR DIATUR OLEH KARTIK DI FORM
        $('#accountpayable-balance').val(id_formatter.format(balance));
        
    }

});

