<?php


function backView($view, $data=array(), $no_assets=false, $return = false): bool|string
{
    if(!isset($data['page'])) $data['page'] = 'Accueil';

    $default = array(
        'page_title'     => $data['page'] . " | CRM",
    );

    $data = array_merge($data, $default);

    $output = '';

    if(!$no_assets) $output .= view('layouts/header',$data);
    if(!$no_assets) $output .= view('layouts/topbar',$data);
    if(!$no_assets) $output .= view('layouts/sidebar',$data);
    $output .= view($view,$data);
    if(!$no_assets) $output .= view('layouts/footer',$data);

    if(!$return) echo $output;

    return $return ? $output : TRUE;
}


function defaultImageProfile(){

    return '/assets/images/users/user.png';

}

function defaultLogoSite(){

    return '/assets/images/verychic_logo.png';

}




