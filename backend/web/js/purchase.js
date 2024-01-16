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
        //CHECK FORMATTER IN MAIN CONFIG.
        const id_formatter = new Intl.NumberFormat(
                'id-ID', { maximumSignificantDigits: 8, maximumFractionDigits: 3 }
        );

        thousandSeparator = getSeparator('id-ID','group');
        //thousandSeparator= <?php echo Yii::$app->formatter->thousandSeparator ?>
        if(thousandSeparator=='.'){
            thousandSeparator = /\./g;
        }
        
        totalClaim = 0;

        for(i=0; i < 30; i++){
            if($('#purchasedetail-' + i + '-quantity').length > 0 ||
                    $('#purchasedetail-' + i + '-price').length > 0) {

                //HILANGKAN GRUP SEPARATOR
                detailQuantity  = +$('#purchasedetail-' + i + '-quantity').val().replace(thousandSeparator, "");
                detailPrice     = +$('#purchasedetail-' + i + '-price').val().replace(thousandSeparator, "");
                detailTotal     = detailQuantity*detailPrice;

                //HITUNG AKUMULASI TOTAL DETAIL
                totalClaim = totalClaim + detailTotal;

                //GRUP SEPARATOR DIATUR OLEH KARTIK DI FORM
                $('#purchasedetail-' + i + '-quantity-disp').val(detailQuantity);
                $('#purchasedetail-' + i + '-price-disp').val(detailPrice);
                $('#purchasedetail-' + i + '-total-disp').val(detailTotal);
            }
        }

        //HILANGKAN GRUP SEPARATOR SEBELUM DIHITUNG
        claim       = +$('#purchase-claim').val().replace(thousandSeparator, "");
        surcharge   = +$('#purchase-surcharge-disp').val().replace(thousandSeparator, "");
        penalty     = +$('#purchase-penalty-disp').val().replace(thousandSeparator, "");
        discount    = +$('#purchase-discount_nominal-disp').val().replace(thousandSeparator, "");
        payment     = +$('#purchase-payment-disp').val().replace(thousandSeparator, "");

        //HITUNG TOTAL & BALANCE
        claim       = totalClaim;
        total       = claim + surcharge + penalty;
        balance     = payment-(total-discount);
        
        
        $('#purchase-claim').val(id_formatter.format(claim));
        $('#purchase-surcharge-disp').val(surcharge); //GRUP SEPARATOR DIATUR OLEH KARTIK DI FORM
        $('#purchase-penalty-disp').val(penalty); //GRUP SEPARATOR DIATUR OLEH KARTIK DI FORM
        $('#purchase-total').val(id_formatter.format(total));
        $('#purchase-discount_nominal-disp').val(discount);//GRUP SEPARATOR DIATUR OLEH KARTIK DI FORM
        $('#purchase-payment-disp').val(payment);//GRUP SEPARATOR DIATUR OLEH KARTIK DI FORM
        $('#purchase-balance').val(id_formatter.format(balance));
        
    }

});

