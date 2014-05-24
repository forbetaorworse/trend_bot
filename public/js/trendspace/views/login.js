window.LoginView = Backbone.View.extend({

	events: {
		"change #email"			: "setEmail",
		"change #password"		: "setPassword",
		"click .submit" 		: "login"

	},

	initialize: function() {
		this.render();
	},

	validated: function(valid){
		if (valid){
			this.view.loginButton.removeAttr("disabled");
		} else {
			this.view.loginButton.attr("disabled", "true");
		}
    },

	render: function() {
		$(this.el).html(this.template());
		return this;
	},

	setEmail: function(event) {
		this.model.set({ email: this.email.val()});
	},

	setPassword: function(event) {
		this.model.set({ password: this.password.val()});
	},

	login: function(event) {
		event.preventDefault();
		user = new User();
		alert('what the fuck no way it works');
	}

});