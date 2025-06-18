        const signUpButton = document.getElementById('signUp');
	const signInButton = document.getElementById('signIn');
	const container = document.getElementById('container');

	signUpButton.addEventListener('click', () => {
	    container.classList.add("right-panel-active");
	});

	signInButton.addEventListener('click', () => {
	    container.classList.remove("right-panel-active");
	});

        // Add floating animation to brand logo
        const brandLogo = document.querySelector('.brand-logo');
        setInterval(() => {
            brandLogo.style.transform = 'translateX(-50%) translateY(-5px)';
            setTimeout(() => {
                brandLogo.style.transform = 'translateX(-50%) translateY(0px)';
            }, 1000);
        }, 3000);
