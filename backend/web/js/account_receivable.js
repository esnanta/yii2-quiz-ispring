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

    $("[id^=accountreceivable-]").change(function () {
        calculate();
    });

    $(document).on("change", "[id^=accountreceivabledetail-]" ,function() {
       calculate();
    });

    $(document).on("click", "[id^=accountreceivable-detail-del-btn]" , function(){
        calculate();
    });

//    $(document).on("click", "a", function(){
//        alert("A link was clicked!");
//    });
//    SISAKAN SEBAGAI CONTOH
//    $("#accountreceivable-payment").change(function () {
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
            if($('#accountreceivabledetail-' + i + '-amount-disp').length > 0 ) {

                //HILANGKAN GRUP SEPARATOR
                detailAmount  = +$('#accountreceivabledetail-' + i + '-amount-disp').val().replace(thousandSeparator, "");

                //HITUNG AKUMULASI TOTAL DETAIL
                totalClaim = totalClaim + detailAmount;

                //GRUP SEPARATOR DIATUR OLEH KARTIK DI FORM
                $('#accountreceivabledetail-' + i + '-amount-disp').val(detailAmount);
            }
        }

        //HILANGKAN GRUP SEPARATOR SEBELUM DIHITUNG
        claim       = +$('#accountreceivable-claim').val().replace(thousandSeparator, "");
        surcharge   = +$('#accountreceivable-surcharge-disp').val().replace(thousandSeparator, "");
        penalty     = +$('#accountreceivable-penalty-disp').val().replace(thousandSeparator, "");
        discount    = +$('#accountreceivable-discount_nominal-disp').val().replace(thousandSeparator, "");
        payment     = +$('#accountreceivable-payment-disp').val().replace(thousandSeparator, "");

        //HITUNG TOTAL & BALANCE
        claim       = totalClaim;
        total       = claim + surcharge + penalty;
        balance     = payment-(total-discount);
        
        
        $('#accountreceivable-claim').val(id_formatter.format(claim));
        $('#accountreceivable-surcharge-disp').val(surcharge); //GRUP SEPARATOR DIATUR OLEH KARTIK DI FORM
        $('#accountreceivable-penalty-disp').val(penalty); //GRUP SEPARATOR DIATUR OLEH KARTIK DI FORM
        $('#accountreceivable-total').val(id_formatter.format(total));
        $('#accountreceivable-discount_nominal-disp').val(discount);//GRUP SEPARATOR DIATUR OLEH KARTIK DI FORM
        $('#accountreceivable-payment-disp').val(payment);//GRUP SEPARATOR DIATUR OLEH KARTIK DI FORM
        $('#accountreceivable-balance').val(id_formatter.format(balance));
        
    }

});

