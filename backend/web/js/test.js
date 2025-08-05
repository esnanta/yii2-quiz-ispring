/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


//http://jsfiddle.net/kY98p/10/


$(document).ready(function () {

    $("[id^=purchase-]").change(function () {
        calculate();
    });

    $(document).on("change", "[id^=purchasedetail-]" ,function() {
       calculate();
    });

    $(document).on("click", "[id^=purchase-detail-del-btn]" , function(){
        calculate();
    });

//    $(document).on("click", "a", function(){
//        alert("A link was clicked!");
//    });
//    SISAKAN SEBAGAI CONTOH
//    $("#purchase-payment").change(function () {
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
        const id_formatter = new Intl.NumberFormat(
                'id-ID', { maximumSignificantDigits: 8}
        );

        thousandSeparator = getSeparator('id-ID','group');
        if(thousandSeparator=='.'){
            thousandSeparator = /\./g;
        }
        

        
        claim       = +$('#purchase-claim-disp').val().replace(thousandSeparator, '');
        surcharge   = +$('#purchase-surcharge-disp').val().replace(thousandSeparator, '');
        total       = claim+surcharge;
        
        console.log(claim);
        console.log(surcharge);
        console.log(total);
        
        +$('#purchase-total-disp').val(total);
        
        //HILANGKAN KOMA SEBELUM DIHITUNG
//        claim       = +$('#purchase-claim-disp').val().replace(thousandSeparator, "");
//        surcharge   = +$('#purchase-surcharge-disp').val().replace(thousandSeparator, "");
//        penalty     = +$('#purchase-penalty-disp').val().replace(thousandSeparator, "");
//        discount    = +$('#purchase-discount_nominal-disp').val().replace(thousandSeparator, "");
//        payment     = +$('#purchase-payment-disp').val().replace(thousandSeparator, "");

    }

});

