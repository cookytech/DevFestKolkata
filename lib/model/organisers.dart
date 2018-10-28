class Organiser {
  final String title;
  final String logoURI;
  final String genericDescription;
  final String specialDescription;
  final String fbURL;
  final String twitterURL;
  final String imageURI;
  final String meetUpUrl;

  const Organiser({
    this.title,
    this.logoURI,
    this.genericDescription,
    this.specialDescription,
    this.fbURL = '',
    this.twitterURL = '',
    this.imageURI,
    this.meetUpUrl = '',
  });
}

const organisers = <Organiser>[
  Organiser(
    title: "WTM Kolkata",
    genericDescription:
    'Women Techmakers India aims to be a unifier in the ecosystem of women in technology by collaborating with other communities, tech companies, and influencers.'
        'As India quickly emerges as a hub for inspiring innovation, we are committing to engaging, enabling, and empowering women in the technology spectrum through focused initiatives.'
        'For the first time, Google’s Women Techmakers has commissioned a study to gain insights into the health of women in the technology sector in India. We aim to share the knowledge gained with the ecosystem and get a better understanding of how to strategically uplift more Indian women in technology across all career levels.',
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
    imageURI: 'assets/image/wtm_background.jpg',
  ),

  Organiser(
    title: "GDG Kolkata",
    genericDescription:
        'The GDG platform is a membership level within the wider Google Developers Community Groups program and it offers tailored support to organizers of local GDG chapters.'
        'GDGs are local groups of developers who are specifically interested in Google products and APIs. Each local group is called a GDG chapter and can host a variety of technical activities for developers - from just a few people getting together to watch our latest videos, to large gatherings with demos and tech talks, to hackathons.'
        'Google Developers supports and recognizes GDG chapters, but doesn’t own or manage them.',
    fbURL: 'https://www.facebook.com/GDGKolkata/',
    logoURI: 'assets/logo/google-developers.png',
    specialDescription:
        'Google Developer Group (GDG) Kolkata is a community based focused group for developers on Google and related technologies.'
        'The Community also looks out for developers who would like to contribute,create and grow in their lives by involving themselves in the massive projects that Google heads every year viz GSoC[Google Summer of Code],Andriod App Development.',
    twitterURL: 'https://twitter.com/gdgkolkata?s=09',
    imageURI: 'assets/image/gdg_background.jpg',
    meetUpUrl:
        'https://www.meetup.com/GDG-Kolkata/?fbclid=IwAR0_DJa7IYf_pE_3x3dnWwm_Q140pVODqJ0GNxJX-oyyuoG5--pDI095Jjc',
  ),
  Organiser(
    title: "DSC Kolkata",
    genericDescription:
        'DSC is a Google Developers program for university students, designed to help them build their mobile and web development skills and knowledge. It is open to any student, ranging from novice developers who are just starting, to advanced developers who want to further their skills. It is intended to be a space for students to learn and collaborate as they solve mobile and web development problems.',
    fbURL: 'https://www.facebook.com/DSCKolkata/',
    logoURI: 'assets/logo/dsc.png',
    specialDescription:
        'Developer Student Clubs- DSC Kolkata is a open community set up by the college students with a focus of enhancing web and mobile development skills of students.'
        'Besides being a college based community it has been able to draw a lot of attention through the events such a Google IO Extended\'18 & a 30 day Machine Learning Crash Course Study Jam,  organised and sponsored completely by the community itself. Currently there are 2 DSC Leads working in 2 colleges in Kolkata alongside other sudo DSCs running and exchanging expertise and experiences.',
    twitterURL: 'https://twitter.com/DSCKolkata',
    imageURI: 'assets/image/dsc_kolkata_background.png',
  ),
];
