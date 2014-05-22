var AppRouter = Backbone.Router.extend({
	routes: {
		""					: "home",
		"login"				: "login",
		"signup"			: "signup",
		"users"				: "showUsers"
	},

	initialize: function() {
		this.headerView = new HeaderView();
		this.footerView = new FooterView();

		$('#header').html(this.headerView.el);
		$('#footer').html(this.footerView.el);
	},

	home: function(id) {
		if (!this.homeView) {
			this.homeView = new HomeView();
		}
		$('#content').html(this.homeView.el);
	},

	login: function(id) {
		if (!this.loginView) {
			this.loginView = new LoginView();
		}
		$('#content').html(this.loginView.el);
	},

	signup: function(id) {
		if (!this.signupView) {
			this.signupView = new SignupView();
		}
		$('#content').html(this.signupView.el);
	}

});


templates = [
	'FooterView',
	'LoginView',
	'HeaderView',
	'HomeView',
	'SignupView'
];


utils.loadTemplate(templates, function() {
	app = new AppRouter();
	Backbone.history.start({ pushState: true });

	// Prevent page refreshes on pushState pages
	$(document).on('click', 'a:not([data-bypass])', function (evt) {
	    var href = $(this).attr('href');
	    var protocol = this.protocol + '//';
	    if (href.slice(protocol.length) !== protocol) {
	    	evt.preventDefault();
	    	app.navigate(href, true);
    	}
    });
});