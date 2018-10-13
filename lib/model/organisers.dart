class Organiser {
  final String title;
  final String logoURI;
  final String genericDescription;
  final String specialDescription;
  final String fbURL;
  final String twitterURL;
  final String imageURI;

  const Organiser({
    this.title,
    this.logoURI,
    this.genericDescription,
    this.specialDescription,
    this.fbURL,
    this.twitterURL,
    this.imageURI,
  });
}

const organisers = <Organiser>[
  Organiser(
    title: "GDG Kolkata",
    genericDescription:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed'
        ' do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
        ' Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi'
        ' ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit'
        ' in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'
        ' Excepteur sint occaecat cupidatat non proident, sunt in culpa qui'
        ' officia deserunt mollit anim id est laborum.',
    fbURL: 'https://www.facebook.com/GDGKolkata/',
    logoURI: 'assets/logo/google-developers.png',
    specialDescription:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed'
        ' do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
        ' Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi'
        ' ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit'
        ' in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'
        ' Excepteur sint occaecat cupidatat non proident, sunt in culpa qui'
        ' officia deserunt mollit anim id est laborum.',
    twitterURL: 'https://twitter.com/gdgkolkata?s=09',
    imageURI: 'assets/image/gdg_background.jpg',
  ),
  Organiser(
    title: "WTM Kolkata",
    genericDescription:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed'
        ' do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
        ' Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi'
        ' ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit'
        ' in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'
        ' Excepteur sint occaecat cupidatat non proident, sunt in culpa qui'
        ' officia deserunt mollit anim id est laborum.',
    fbURL: 'https://www.facebook.com/WTMKolkata/',
    logoURI: 'assets/logo/wtm.png',
    specialDescription:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed'
        ' do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
        ' Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi'
        ' ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit'
        ' in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'
        ' Excepteur sint occaecat cupidatat non proident, sunt in culpa qui'
        ' officia deserunt mollit anim id est laborum.',
    twitterURL: '',
    imageURI: 'assets/image/wtm_background.jpg',
  ),
  Organiser(
    title: "DSC Kolkata",
    genericDescription:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed'
        ' do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
        ' Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi'
        ' ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit'
        ' in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'
        ' Excepteur sint occaecat cupidatat non proident, sunt in culpa qui'
        ' officia deserunt mollit anim id est laborum.',
    fbURL: 'https://www.facebook.com/DSCKolkata/',
    logoURI: 'assets/logo/dsc.png',
    specialDescription:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed'
        ' do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
        ' Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi'
        ' ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit'
        ' in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'
        ' Excepteur sint occaecat cupidatat non proident, sunt in culpa qui'
        ' officia deserunt mollit anim id est laborum.',
    twitterURL: 'https://twitter.com/DSCKolkata',
    imageURI: 'assets/image/dsc_kolkata_background.png',
  ),
];
