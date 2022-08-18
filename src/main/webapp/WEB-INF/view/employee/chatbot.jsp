<div class="chat_outer panel-body-content" id="chatouter"
	style="display: none">
	<div class="chat_box" style="z-index: 9999">
		<!-- <div class="get-start"><span>Get Started</span></div> -->
		<div class="chat_header" style="background: #000000;">
			<img
				src="${pageContext.request.contextPath }/employeeResources/images/logo.png"
				height="30" width="130" />
			<div class="pannel_setting">
				<a class="minimize" href="#" onclick="fnhidechat()"><img
					src="${pageContext.request.contextPath }/employeeResources/images/minimize.png" /></a>
				<%-- <a class="cross" href="#"><img
						src="${pageContext.request.contextPath }/employeeResources/images/cross.png" /></a> --%>
			</div>
			<h4
				style="font-family: monospace; font-style: italic; font-weight: lighter; color: #ffffff; margin: 0;">
				Chat Bot</h4>
			<div class="user-position online">Online</div>
			<!-- <h6 style="font-family:inherit; font-style:italic;   color: #eee">We love to deliver you useful information 365 x 7 x 24 - Every moments!</h6> -->
			<h3 class="content-box-sub-h"></h3>
		</div>
		<div class="chat_room light">
			<div>

				<div id="chatcarousel">
					<div class="crousel_area">
						<div class="padding-crousel">
							<div class="item itmename"
								style="background-color: #25557c; font-weight: lighter;">
								<div>May I help for searching your needs.</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="chat_form" style="background-color: #000000">
			<form>
				<!-- <span class="record"><a id="record"
						href="javascript:void(0)" ></a></span> 
					 -->
				<span> <input type="text" id="final_span" spellcheck="true"
					maxlength="500" name="noidung" placeholder="Send a message"
					autocomplete="off"
					style="font-weight: bold; color: black; font-style: italic"
					onkeypress="return runScript(event)">
				</span>
			</form>
		</div>
	</div>
	<script>
			$(document).ready(
							function() {
								$(".owl-carousel")
										.owlCarousel(
												{
													nav : true,
													stagePadding : 30,
													margin : 10,
													navText : [
															"<img src='${pageContext.request.contextPath }/employeeResources/images/previuos.png'>",
															"<img src='${pageContext.request.contextPath }/employeeResources/images/next.png'>" ],
													responsive : {
														// breakpoint from 0 up
														0 : {
															items : 2,
														},
														// breakpoint from 480 up
														480 : {
															items : 3,
														},
														// breakpoint from 768 up
														768 : {
															items : 2,
														}
													}
												});
								$(".record a").click(function() {
									$(".record a").toggleClass("active");
								});
								$("input.submit_btn").click(
										function() {
											$("input.submit_btn").toggleClass(
													"active");
										});
								$(".mute a").click(function() {
									$(".mute a").toggleClass("active");
								});
							});
			$(".get-start span").click(function() {
				$(".get-start").fadeOut();

				document.getElementById("final_span").value = "welcome";
				send();
			});

			(function($) {
				$(window).on("load", function() {
					$(".chat_room").mCustomScrollbar({
						theme : "minimal"
					});
				});
			})(jQuery);
		</script>

	<script>
			var incrementerSender = 0;
			var context = "";
			var carousel;
			var replies;
			var img;

			function runScript(e) {
				if (event.which == 13) {
					event.preventDefault();
					var tb = document.getElementById("final_span");
					//alert(tb.value);
					fnchattext();
					return false;
				}
			}

			function fnchattext() {
				var input = $("#final_span").val();
				if (input == null || input == 'null' || input == '') {
					//alert("Value........");
				} else {
					//console.log("incrementerSender" + incrementerSender);
					$(
							'<div class="sender_box_outer" id="divtest'+incrementerSender+'"><div class="sender_box"><div class="sender_logo"><img src="${pageContext.request.contextPath }/employeeResources/images/sender-logo.png"  /></div><div class="sender_chat"><div class="senderchat-pane first">'
									+ input + '<br /></div></div></div></div>')
							.appendTo('#chatcarousel');
					$('div.sender_box_outer').slideDown("slow");
					//console.log($("#chatcarousel").html());
					$("#mcs_container").mCustomScrollbar("scrollTo",
							'#divtest' + incrementerSender + '');
					incrementerSender++;
					send(incrementerSender);
				}
			}

			var accessToken = 'b8cbf220ae5a4d6ab76c9edf58155683';

			var passVar = 1;
			
			var baseUrl = "https://api.api.ai/v1/query?v=20150910";
			var messageSorry = "I'm sorry, I don't have the answer to that yet.";
			var incrementer = 0;
			var message;
			var onlyButtons = 0;
			var userId = 1;//UUid().generate();

			//api.ai call ...
			function send() {
				 var input = $("#final_span").val().toLowerCase();
				//console.log("input", input);

				$("#final_span").val("");
				//alert(input);
				$.ajax({
					type : "POST",
					url : baseUrl + "query",
					contentType : "application/json; charset=utf-8",
					dataType : "json",
					headers : {
						"Authorization" : "Bearer " + accessToken
					},
					data : JSON.stringify({
						query : input,
						lang : "en",
						sessionId : ${sessionScope.loginId},
						loginId : ${sessionScope.loginId}
					}),
					success : function(data) {
						//console.log("data_send");
						//console.log(data);
						prepareResponse(data);
					}
				});
			}

			//generate the response ...
			function prepareResponse(val) {
				console.log("response");
				console.log(val);
				var messages = val.result.fulfillment.messages;
				if (val.result.contexts != null
						&& val.result.contexts.length > 0) {
					context = val.result.contexts[val.result.contexts.length - 1];
					//console.log("========================================");
					//console.log(context);
					//console.log("========================================");

				}
				for (var i = 0; i < messages.length; i++) {
					var message = messages[i];
					//console.log(message);
					switch (message.type) {

					//text message .......
					case 0:
						/* alert("hi"); */

						message = message.speech;
						//console.log("message_return", message);

						$(
								'<div class="reciver_box_outer" id="receiver'+incrementer+'"><div class="reciver_box"><div class="reciver_logo"><img src="${pageContext.request.contextPath }/employeeResources/images/owner-logo.png"  /></div><div class="reciver_chat"><div class="reciverchat-pane first">'
										+ message + '</div></div></div></div>')
								.appendTo('#chatcarousel');
						$("#mcs_container").mCustomScrollbar("scrollTo",
								'#receiver' + incrementer + '');
						incrementer++;

						break;

					//cards ..............    
					case 1:
						//console.log("message == ",message);
						carousel = [ message ];
						//console.log("carousel == ",carousel);
						for (i++; i < messages.length; i++) {
							//console.log("carousel message.........");
							if (messages[i].type == 1) {
								carousel.push(messages[i]);
							} else {
								i--;
								break;
							}
						}
						var fullDiv;

						for (var i = 0; i < carousel.length; i++) {
							var button;
							if (i == 0) {

								//if buttons are present in the carosusel.....

								if (carousel[0].buttons.length != 0) {
									for (var j = 0; j < carousel[0].buttons.length; j++) {
										if (j == 0) {
											var text = carousel[0].buttons[j].postback;
											if (text.indexOf("http") > -1) {
												button = '<a href='+text+' class="widget-chat-carousel-item-button widget-chat-reply-button"  target="_blank">'
														+ carousel[0].buttons[j].text
														+ '</a>';
											} else {
												button = '<a href="#" class="widget-chat-carousel-item-button widget-chat-reply-button" id="'
														+ carousel[0].buttons[j].text
														+ '" onclick = "fn(this.id);" value="'
														+ carousel[i].buttons[j].postback
														+ '">'
														+ carousel[0].buttons[j].text
														+ '</a>';
											}

										} else {
											var text = carousel[i].buttons[j].postback;
											if (text.indexOf("http") > -1) {
												button = button
														+ '<a href='+text+' class="widget-chat-carousel-item-button widget-chat-reply-button" target="_blank">'
														+ carousel[i].buttons[j].text
														+ '</a>';
											} else {
												button = button
														+ '<a href="#" id="'
														+ carousel[i].buttons[j].text
														+ '" class="widget-chat-carousel-item-button widget-chat-reply-button" '
														+ carousel[0].buttons[j].text
														+ ' onclick = "fn(this.id);" value="'
														+ carousel[i].buttons[j].postback
														+ '">'
														+ carousel[i].buttons[j].text
														+ '</a>';
											}

										}
									}

									//check if image is present or not ...
									if ("imageUrl" in carousel[i]) {

										//console.log("image is present......");
										fullDiv = '<div> <div class="widget-chat-carousel-item"> <div class="widget-chat-carousel-item-content"> <div class="widget-chat-carousel-item-content-image" style="background-image: url(" petersfancybrownhats.com/company_image.png");"><img src="'+carousel[i].imageUrl+'" alt="" /></div> <div class="widget-chat-carousel-item-content-description"> <h4 class="widget-chat-carousel-item-content-description-title">'
												+ carousel[i].title
												+ '</h4> </div> </div>'
												+ button + '</div> </div>';
									} else {
										onlyButtons = 1;
										//console.log("image is not present..." + onlyButtons)
										fullDiv = '<div class="widget-chat-button-item-question"> <div class="widget-chat-button-item-question-content">'
												+ carousel[i].title
												+ '</div> </div>' + button + '';
									}

								}

								// button is not present in carosuel....
								else
									fullDiv = '<div> <div class="widget-chat-carousel-item"> <div class="widget-chat-carousel-item-content"> <div class="widget-chat-carousel-item-content-image" style="background-image: url(" petersfancybrownhats.com/company_image.png");"><img src="'+carousel[i].imageUrl+'" alt="" /></div> <div class="widget-chat-carousel-item-content-description"> <h4 class="widget-chat-carousel-item-content-description-title">'
											+ carousel[i].title
											+ '</h4> </div> </div></div> </div>';

							} else {

								// morethan one buttons are present in carousel ...
								if (carousel[i].buttons.length != 0) {
									for (var j = 0; j < carousel[i].buttons.length; j++) {
										if (j == 0) {
											var text = carousel[i].buttons[j].postback;
											if (text.indexOf("http") > -1) {
												button = '<a href='+text+' class="widget-chat-carousel-item-button widget-chat-reply-button" target="_blank">'
														+ carousel[i].buttons[j].text
														+ '</a>';
											} else {
												button = '<a href="#" id='
														+ carousel[i].buttons[j].text
														+ ' class="widget-chat-carousel-item-button widget-chat-reply-button" onclick = "fn(this.id);" value='
														+ carousel[i].buttons[j].postback
														+ '>'
														+ carousel[i].buttons[j].text
														+ '</a>';
											}

										} else {
											var text = carousel[i].buttons[j].postback;
											if (text.indexOf("http") > -1) {
												button = '<a href='+text+' class="widget-chat-carousel-item-button widget-chat-reply-button" id='+carousel[i].buttons[j].text+' target="_blank">'
														+ carousel[i].buttons[j].text
														+ '</a>';
											} else {
												button = '<a href="#" class="widget-chat-carousel-item-button widget-chat-reply-button" id='
														+ carousel[i].buttons[j].text
														+ ' onclick = "fn(this.id);" value='
														+ carousel[i].buttons[j].postback
														+ '>'
														+ carousel[i].buttons[j].text
														+ '</a>';
											}

										}
									}

									fullDiv = fullDiv
											+ '<div> <div class="widget-chat-carousel-item"> <div class="widget-chat-carousel-item-content"> <div class="widget-chat-carousel-item-content-image" style="background-image: url(" petersfancybrownhats.com/company_image.png");"><img src="'+carousel[i].imageUrl+'" alt="" /></div> <div class="widget-chat-carousel-item-content-description"> <h4 class="widget-chat-carousel-item-content-description-title">'
											+ carousel[i].title
											+ '</h4> </div> </div>' + button
											+ '</div> </div>';

								}
								//button is not present in carousel ...	
								else
									fullDiv = fullDiv
											+ '<div> <div class="widget-chat-carousel-item"> <div class="widget-chat-carousel-item-content"> <div class="widget-chat-carousel-item-content-image" style="background-image: url(" petersfancybrownhats.com/company_image.png");"><img src="'+carousel[i].imageUrl+'" alt="" /></div> <div class="widget-chat-carousel-item-content-description"> <h4 class="widget-chat-carousel-item-content-description-title">'
											+ carousel[i].title
											+ '</h4> </div> </div></div> </div>';

							}
						}

						//check if only buttons is present  than apply css of button not carousel ...
						if (onlyButtons == 1) {
							$(
									'<div class="crousel_area" id="carousel'+incrementer+'"> <div class="padding-crousel"><div class="widget-chat-buttons">'
											+ fullDiv + '</div></div></div>')
									.appendTo('#carousel');
						}

						//apply css of carousel ...
						else {
							$(
									'<div class="crousel_area" id="carousel'+incrementer+'"> <div class="padding-crousel"><div class="owl-carousel">'
											+ fullDiv + '</div> </div> </div>')
									.appendTo('#carousel');
						}

						$(".owl-carousel")
								.owlCarousel(
										{
											nav : true,
											stagePadding : 30,
											margin : 10,
											navText : [
													"<img src='${pageContext.request.contextPath }/employeeResources/images/previuos.png'>",
													"<img src='${pageContext.request.contextPath }/employeeResources/images/next.png'>" ],
											responsive : {
												// breakpoint from 0 up
												0 : {
													items : 2,
												},
												// breakpoint from 480 up
												480 : {
													items : 3,
												},
												// breakpoint from 768 up
												768 : {
													items : 2,
												}
											}
										});

						$("#mcs_container").mCustomScrollbar("scrollTo",
								'#carousel' + incrementer + '');
						incrementer++;

						break;

					// Quick  replay    
					case 2:
						replies = message.replies;

						var fullDiv = '<div> <button class="widget-chat-quick-reply-item widget-chat-reply-button">I like it!</button> </div>';

						for (var i = 0; i < replies.length; i++) {
							if (i == 0) {

								fullDiv = '<div> <button class="widget-chat-quick-reply-item widget-chat-reply-button" value='
										+ replies[i]
										+ ' id='
										+ replies[i]
										+ ' onclick = "myFunction(this.id);">'
										+ replies[i] + '</button> </div>';
							} else
								fullDiv = fullDiv
										+ '<div> <button class="widget-chat-quick-reply-item widget-chat-reply-button" value='
										+ replies[i] + ' id=' + replies[i]
										+ ' onclick = "myFunction(this.id);">'
										+ replies[i] + '</button> </div>';
						}

						$(
								'<div class="crousel_area" id="carousel'+incrementer+'"> <div class="padding-crousel"><div class="owl-carousel">'
										+ fullDiv + '</div> </div> </div>')
								.appendTo('#carousel');
						//carousel effect style and scroll images
						$(".owl-carousel")
								.owlCarousel(
										{
											nav : true,
											stagePadding : 30,
											margin : 10,
											navText : [
													"<img src='${pageContext.request.contextPath }/employeeResources/images/previuos.png'>",
													"<img src='${pageContext.request.contextPath }/employeeResources/images/next.png'>" ],
											responsive : {
												0 : {
													items : 2,
												},
												480 : {
													items : 3,
												},
												768 : {
													items : 2,
												}
											}
										});

						$("#mcs_container").mCustomScrollbar("scrollTo",
								'#carousel' + incrementer + '');
						incrementer++;

						break;

					//only image replay
					case 3:

						if (message.imageUrl) {
							//console.log("image message.........");
							img = message.imageUrl;
							// console.log(img);
						}

						break;

					//custom payload ...
					case 4:
						if (message.payload && message.payload.facebook) {

							//console.log(message.payload.facebook.attachment.payload);
							if ('elements' in message.payload.facebook.attachment.payload) {
								var elements = message.payload.facebook.attachment.payload.elements;
								var fullDiv;
								for (var i = 0; i < elements.length; i++) {
									var element = elements[i];
									var title = element.title;
									var image_url = element.image_url;
									var subtitle = element.subtitle;
									var buttons = element.buttons;
									//console.log(element);
									//console.log(title);
									//console.log(image_url);
									//console.log(subtitle);
									//console.log(buttons.length);

									var button_value = buttons[0].title;

									if (i == 0) {
										fullDiv = '<div class="widget-chat-list-item"> <div class="widget-chat-list-item-content"> <div class="widget-chat-list-item-content-description"> <h4 class="widget-chat-list-item-content-description-title">'
												+ title
												+ '</h4> <div class="widget-chat-list-item-content-description-subtitle">'
												+ subtitle
												+ '</div><button class="widget-chat-list-item-content-description-button widget-chat-reply-button">'
												+ button_value
												+ '</button></div> <img class="widget-chat-list-item-content-image" src="'+image_url+'"> </div> </div>'
									}

									else {
										fullDiv = fullDiv
												+ '<div class="widget-chat-list-item"> <div class="widget-chat-list-item-content"> <div class="widget-chat-list-item-content-description"> <h4 class="widget-chat-list-item-content-description-title">'
												+ title
												+ '</h4> <div class="widget-chat-list-item-content-description-subtitle">'
												+ subtitle
												+ '</div><button class="widget-chat-list-item-content-description-button widget-chat-reply-button">'
												+ button_value
												+ '</button></div> <img class="widget-chat-list-item-content-image" src="'+image_url+'"> </div> </div>'
									}

								}
								$(
										'<div class="crousel_area" id="carousel'+incrementer+'"> <div class="padding-crousel"><div class="widget-chat-list">'
												+ fullDiv
												+ '</div></div> </div>')
										.appendTo('#carousel');

								//apply scrolling images and style ...
								$(".owl-carousel")
										.owlCarousel(
												{
													nav : true,
													stagePadding : 30,
													margin : 10,
													navText : [
															"<img src='${pageContext.request.contextPath }/employeeResources/images/previuos.png'>",
															"<img src='${pageContext.request.contextPath }/employeeResources/images/next.png'>" ],
													responsive : {
														0 : {
															items : 2,
														},
														480 : {
															items : 3,
														},
														768 : {
															items : 2,
														}
													}
												});

								$("#mcs_container").mCustomScrollbar(
										"scrollTo",
										'#carousel' + incrementer + '');
							} else if ('quick_replies' in message.payload.facebook.attachment.payload) {
								var replies = message.payload.facebook.attachment.payload.quick_replies;
								//console.log("replies  == "+replies);
								var fullDiv = '<div> <button class="widget-chat-quick-reply-item widget-chat-reply-button">I like it!</button> </div>';

								for (var i = 0; i < replies.length; i++) {
									//console.log(replies[i].payload);
									if (i == 0) {

										fullDiv = '<div> <button class="widget-chat-quick-reply-item widget-chat-reply-button" value="'
												+ replies[i].payload
												+ '" id="'
												+ replies[i].payload
												+ '" onclick = "myFunction(this.id);">'
												+ replies[i].title
												+ '</button> </div>';
									} else
										fullDiv = fullDiv
												+ '<div> <button class="widget-chat-quick-reply-item widget-chat-reply-button" value="'
												+ replies[i].payload
												+ '" id="'
												+ replies[i].payload
												+ '" onclick = "myFunction(this.id);">'
												+ replies[i].title
												+ '</button> </div>';
								}

								$(
										'<div class="crousel_area" id="carousel'+incrementer+'"> <div class="padding-crousel"><div class="owl-carousel">'
												+ fullDiv
												+ '</div> </div> </div>')
										.appendTo('#carousel');
								//carousel effect style and scroll images
								$(".owl-carousel")
										.owlCarousel(
												{
													nav : true,
													stagePadding : 30,
													margin : 10,
													navText : [
															"<img src='${pageContext.request.contextPath }/employeeResources/images/previuos.png'>",
															"<img src='${pageContext.request.contextPath }/employeeResources/images/next.png'>" ],
													responsive : {
														0 : {
															items : 2,
														},
														480 : {
															items : 3,
														},
														768 : {
															items : 2,
														}
													}
												});

								$("#mcs_container").mCustomScrollbar(
										"scrollTo",
										'#carousel' + incrementer + '');
							} else {
								var carousel = message.payload.facebook.attachment.payload.card;
								//console.log("message == ",message);
								//var carousel = [message];
								console.log("carousel == ", carousel);
								//console.log("carousel == ",carousel);
								for (var i; i < messages.length; i++) {
									// console.log("carousel message.........");
									if (messages[i].type == 1) {
										carousel.push(messages[i]);
									} else {
										i--;
										break;
									}
								}
								var fullDiv;

								for (var i = 0; i < carousel.length; i++) {
									var button;
									if (i == 0) {

										//if buttons are present in the carosusel.....

										if (carousel[0].buttons.length != 0) {
											for (var j = 0; j < carousel[0].buttons.length; j++) {
												if (j == 0) {
													var text = carousel[0].buttons[j].postback;
													if (text.indexOf("http") > -1) {
														button = '<a href='+text+' class="widget-chat-carousel-item-button widget-chat-reply-button"  target="_blank">'
																+ carousel[0].buttons[j].text
																+ '</a>';
													} else {
														button = '<a href="#" class="widget-chat-carousel-item-button widget-chat-reply-button" id="'
																+ carousel[0].buttons[j].text
																+ '" onclick = "fn(this.id);" value="'
																+ carousel[i].buttons[j].postback
																+ '">'
																+ carousel[0].buttons[j].text
																+ '</a>';
													}

												} else {
													var text = carousel[i].buttons[j].postback;
													if (text.indexOf("http") > -1) {
														button = button
																+ '<a href='+text+' class="widget-chat-carousel-item-button widget-chat-reply-button" target="_blank">'
																+ carousel[i].buttons[j].text
																+ '</a>';
													} else {
														button = button
																+ '<a href="#" id="'
																+ carousel[i].buttons[j].text
																+ '" class="widget-chat-carousel-item-button widget-chat-reply-button" '
																+ carousel[0].buttons[j].text
																+ ' onclick = "fn(this.id);" value="'
																+ carousel[i].buttons[j].postback
																+ '">'
																+ carousel[i].buttons[j].text
																+ '</a>';
													}

												}
											}

											//check if image is present or not ...
											if ("imageUrl" in carousel[i]) {

												//console.log("image is present......");
												fullDiv = '<div> <div class="widget-chat-carousel-item"> <div class="widget-chat-carousel-item-content"> <div class="widget-chat-carousel-item-content-image" style="background-image: url(" petersfancybrownhats.com/company_image.png");"><img src="'+carousel[i].imageUrl+'" alt="" /></div> <div class="widget-chat-carousel-item-content-description"> <h4 class="widget-chat-carousel-item-content-description-title">'
														+ carousel[i].title
														+ '</h4> </div> </div>'
														+ button
														+ '</div> </div>';
											} else {
												onlyButtons = 1;
												//console.log("image is not present..." + onlyButtons)
												fullDiv = '<div class="widget-chat-button-item-question"> <div class="widget-chat-button-item-question-content">'
														+ carousel[i].title
														+ '</div> </div>'
														+ button + '';
											}

										}

										// button is not present in carosuel....
										else
											fullDiv = '<div> <div class="widget-chat-carousel-item"> <div class="widget-chat-carousel-item-content"> <div class="widget-chat-carousel-item-content-image" style="background-image: url(" petersfancybrownhats.com/company_image.png");"><img src="'+carousel[i].imageUrl+'" alt="" /></div> <div class="widget-chat-carousel-item-content-description"> <h4 class="widget-chat-carousel-item-content-description-title">'
													+ carousel[i].title
													+ '</h4> </div> </div></div> </div>';

									} else {

										// morethan one buttons are present in carousel ...
										if (carousel[i].buttons.length != 0) {
											for (var j = 0; j < carousel[i].buttons.length; j++) {
												if (j == 0) {
													var text = carousel[i].buttons[j].postback;
													if (text.indexOf("http") > -1) {
														button = '<a href='+text+' class="widget-chat-carousel-item-button widget-chat-reply-button" target="_blank">'
																+ carousel[i].buttons[j].text
																+ '</a>';
													} else {
														button = '<a href="#" id='
																+ carousel[i].buttons[j].text
																+ ' class="widget-chat-carousel-item-button widget-chat-reply-button" onclick = "fn(this.id);" value='
																+ carousel[i].buttons[j].postback
																+ '>'
																+ carousel[i].buttons[j].text
																+ '</a>';
													}

												} else {
													var text = carousel[i].buttons[j].postback;
													if (text.indexOf("http") > -1) {
														button = '<a href='+text+' class="widget-chat-carousel-item-button widget-chat-reply-button" id='+carousel[i].buttons[j].text+' target="_blank">'
																+ carousel[i].buttons[j].text
																+ '</a>';
													} else {
														button = '<a href="#" class="widget-chat-carousel-item-button widget-chat-reply-button" id='
																+ carousel[i].buttons[j].text
																+ ' onclick = "fn(this.id);" value='
																+ carousel[i].buttons[j].postback
																+ '>'
																+ carousel[i].buttons[j].text
																+ '</a>';
													}

												}
											}

											fullDiv = fullDiv
													+ '<div> <div class="widget-chat-carousel-item"> <div class="widget-chat-carousel-item-content"> <div class="widget-chat-carousel-item-content-image" style="background-image: url(" petersfancybrownhats.com/company_image.png");"><img src="'+carousel[i].imageUrl+'" alt="" /></div> <div class="widget-chat-carousel-item-content-description"> <h4 class="widget-chat-carousel-item-content-description-title">'
													+ carousel[i].title
													+ '</h4> </div> </div>'
													+ button + '</div> </div>';

										}
										//button is not present in carousel ...	
										else
											fullDiv = fullDiv
													+ '<div> <div class="widget-chat-carousel-item"> <div class="widget-chat-carousel-item-content"> <div class="widget-chat-carousel-item-content-image" style="background-image: url(" petersfancybrownhats.com/company_image.png");"><img src="'+carousel[i].imageUrl+'" alt="" /></div> <div class="widget-chat-carousel-item-content-description"> <h4 class="widget-chat-carousel-item-content-description-title">'
													+ carousel[i].title
													+ '</h4> </div> </div></div> </div>';

									}
								}

								//check if only buttons is present  than apply css of button not carousel ...
								if (onlyButtons == 1) {
									$(
											'<div class="crousel_area" id="carousel'+incrementer+'"> <div class="padding-crousel"><div class="widget-chat-buttons">'
													+ fullDiv
													+ '</div></div></div>')
											.appendTo('#carousel');
								}

								//apply css of carousel ...
								else {
									$(
											'<div class="crousel_area" id="carousel'+incrementer+'"> <div class="padding-crousel"><div class="owl-carousel">'
													+ fullDiv
													+ '</div> </div> </div>')
											.appendTo('#carousel');
								}

								$(".owl-carousel")
										.owlCarousel(
												{
													nav : true,
													stagePadding : 30,
													margin : 10,
													navText : [
															"<img src='${pageContext.request.contextPath }/employeeResources/images/previuos.png'>",
															"<img src='${pageContext.request.contextPath }/employeeResources/images/next.png'>" ],
													responsive : {
														// breakpoint from 0 up
														0 : {
															items : 2,
														},
														// breakpoint from 480 up
														480 : {
															items : 3,
														},
														// breakpoint from 768 up
														768 : {
															items : 2,
														}
													}
												});

								$("#mcs_container").mCustomScrollbar(
										"scrollTo",
										'#carousel' + incrementer + '');
							}
							incrementer++;
						}
						break;

					default:
						break;

					}
				}

			}

			//take the value of the button tag ...
			function myFunction(id) {
				//console.log(document.getElementById(id).value);
				document.getElementById("final_span").value = document
						.getElementById(id).value;
				fnchattext();
			}

			function fn(a) {
				//take tha value of the anchor tag ...
				//alert(d.getAttribute( 'value' ));
				var d = document.getElementById(a);
				document.getElementById("final_span").value = d.text;
				fnchattext();
			}
		</script>
</div>