<?php
return [
    'adminEmail'                => 'admin@example.com',
    'supportEmail'              => 'support@example.com',
    'senderEmail'               => 'noreply@example.com',
    'senderName'                => 'Example.com mailer',
    'user.passwordResetTokenExpire' => 3600,
    'user.passwordMinLength'    => 8,
    
    
    'meta_description'          => ['name' => 'description', 'content' => 'description'],
    'meta_keywords'             => ['name' => 'keywords', 'content' => 'keywords'],
    'meta_author'               => ['name' => 'author', 'content' => 'author'],
    
    'og_site_name'              => ['property' => 'og:site_name', 'content' => 'site name'],
    'og_title'                  => ['property' => 'og:title', 'content' => 'title'],
    'og_description'            => ['property' => 'og:description', 'content' => 'description'],
    'og_type'                   => ['property' => 'og:type', 'content' => 'website'],
    'og_url'                    => ['property' => 'og:url', 'content' => '/'],
    'og_image'                  => ['property' => 'og:image:secure_url', 'itemprop'=>'image', 'content' => 'image'],
    'og_width'                  => ['property' => 'og:image:width', 'content' => '300'],
    'og_height'                 => ['property' => 'og:image:height', 'content' => '300'],
    'og_updated_time'           => ['property' => 'og:updated_time', 'content' => time()],
    
    'twitter_title'             => ['property' => 'twitter:title', 'content' => 'title'],
    'twitter_description'       => ['property' => 'twitter:description', 'content' => 'description'],
    'twitter_card'              => ['property' => 'twitter:card', 'content' => 'website'],
    'twitter_url'               => ['property' => 'twitter:url', 'content' => '/'],
    'twitter_image'             => ['property' => 'twitter:image', 'content' => 'image'],

    'googleplus_name'           => ['itemprop' => 'name', 'content' => 'title'],
    'googleplus_description'    => ['itemprop' => 'description', 'content' => 'description'],
    'googleplus_image'          => ['itemprop' => 'image', 'content' => 'image'],

    'dateDisplayFormat'         => 'd-m-Y',
    'timeDisplayFormat'         => 'hh:mm:ss a',
    'datetimeDisplayFormat'     => 'dd-MM-yyyy hh:mm:ss a',
    
    'dateSaveFormat'            => 'Y-m-d',
    'timeSaveFormat'            => 'H:i:s',
    'datetimeSaveFormat'        => 'Y-m-d H:i:s',
    
    'userRoleAdmin'             => 'admin',
    'userRoleOwner'             => 'owner',
    'userRoleRegular'           => 'regular'
    
];


