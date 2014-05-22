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
});