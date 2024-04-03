
/*
This function will overhand the PDF File to the React FrontEnd
 */
/*
False = Ja Nein
True = Likerstcale
null = Open Question
 */
function GetData(condition) {
    let topic = condition['topic']
    let Questions = {
        'A': {
            'Pre': {
                first: {
                    question: 'Can you explain what the term "neurodivergent" means? If you\'re unsure, please type "No". (Responses can be given in either German or English.)',
                    answer: '',
                    right: '',
                    left: '',
                    component: null
                },
                second: {
                    question: 'Are you studying psychology or a related field, or have an interest in psychology?',
                    answer: '',
                    right: 'Yes',
                    left: 'No',
                    component: false
                },
                third: {
                    question: 'How frequently do you search the internet for health symptoms or diagnoses when you experience health issues?',
                    answer: '',
                    right: 'Very often',
                    left: 'Never',
                    component: true
                }
            },
            'Post': {
                first: {
                    question: 'How useful did you find the text in providing answers?',
                    answer: '',
                    right: 'Helpful',
                    left: 'Unhelpful',
                    component: true
                },
                second: {
                    question: 'Do you find the text credible?',
                    answer: '',
                    right: 'Credible',
                    left: 'Not credible',
                    component: true
                },
                third:{
                    question: 'Explain why you think the blog article is credible. (Responses can be given in either German or English.)',
                    answer: '',
                    right: '',
                    left: '',
                    component: null
                },
                fourth: {
                    question: 'How comprehensible did you find the blog post?',
                    answer: '',
                    right: 'Understandable',
                    left: 'Confusing',
                    component: true
                },
                fifth: {
                    question: 'How familiar were you with the topic before reading?',
                    answer: '',
                    right: 'Familiar',
                    left: 'Unfamiliar',
                    component: true
                },
                sixth: {
                    question: 'The text discusses diagnosing brain tumours.',
                    answer: '',
                    right: 'Yes',
                    left: 'No',
                    component: false
                },
                seventh: {
                    question: 'The article suggests that discussing mental health is challenging for many.',
                    answer: '',
                    right: 'Yes',
                    left: 'No',
                    component: false
                },
                eight: {
                    question: 'It is mentioned that individuals with mental illness often identify as neurodiverse.',
                    answer: '',
                    right: 'Yes',
                    left: 'No',
                    component: false
                },
            }
        },
        'B': {
            'Pre': {
                first: {
                    question: 'Can you explain the importance of understanding statistical terms like "mean", "standard deviation", and "correlation" in financial analysis? If you\'re unsure, please type "No". (Responses can be given in either German or English.)',
                    answer: '',
                    right: '',
                    left: '',
                    component: null
                },
                second: {
                    question: 'Do you have experience in finance, investment, or a related field, or do you have a keen interest in these areas?',
                    answer: '',
                    right: 'Yes',
                    left: 'No',
                    component: false
                },
                third: {
                    question: 'How frequently do you use or encounter statistical analysis in your financial decision-making or professional activities?',
                    answer: '',
                    right: 'Very often',
                    left: 'Never',
                    component: true
                }
            },
            'Post': {
                first: {
                    question: 'How useful did you find the text in providing answers?',
                    answer: '',
                    right: 'Helpful',
                    left: 'Unhelpful',
                    component: true
                },
                second: {
                    question: 'Do you find the text credible?',
                    answer: '',
                    right: 'Credible',
                    left: 'Not credible',
                    component: true
                },
                third: {
                    question: 'How comprehensible did you find the blog post?',
                    answer: '',
                    right: 'Understandable',
                    left: 'Confusing',
                    component: true
                },
                fourth:{
                    question: 'Explain why you think the blog article is credible. (Responses can be given in either German or English.)',
                    answer: '',
                    right: '',
                    left: '',
                    component: null
                },
                fifth: {
                    question: 'How familiar were you with the topic before reading?',
                    answer: '',
                    right: 'Familiar',
                    left: 'Unfamiliar',
                    component: true
                },
                sixth: {
                    question: 'The text discusses the application of the Capital Asset Pricing Model (CAPM) in investment decisions.',
                    answer: '',
                    right: 'Yes',
                    left: 'No',
                    component: false
                },
                seventh: {
                    question: 'The article mentions the Efficient Market Hypothesis (EMH).',
                    answer: '',
                    right: 'Yes',
                    left: 'No',
                    component: false
                },
                eight: {
                    question: 'Statistical techniques like regression analysis and Monte Carlo simulation are highlighted as crucial for risk assessment in the text.',
                    answer: '',
                    right: 'Yes',
                    left: 'No',
                    component: false
                }
            }
        },
            'C': {
                'Pre': {
                    first: {
                        question: 'Can you explain the significance of historical sports in understanding ancient cultures and societies? If you\'re unsure, please type "No". (Responses can be given in either German or English.)',
                        answer: '',
                        right: '',
                        left: '',
                        component: null
                    },
                    second: {
                        question: 'Do you have an interest or background in cultural history, anthropology, or related fields?',
                        answer: '',
                        right: 'Yes',
                        left: 'No',
                        component: false
                    },
                    third: {
                        question: 'How relevant would you rate the role of extreme sports in today\'s society compared to historical contexts?',
                        answer: '',
                        right: 'Very relevant',
                        left: 'Not relevant at all',
                        component: true
                    }
                },
                'Post': {
                    first: {
                        question: 'How useful did you find the text in providing answers?',
                        answer: '',
                        right: 'Helpful',
                        left: 'Unhelpful',
                        component: true
                    },
                    second: {
                        question: 'Do you find the text credible?',
                        answer: '',
                        right: 'Credible',
                        left: 'Not credible',
                        component: true
                    },
                    third:{
                        question: 'Explain why you think the blog article is credible. (Responses can be given in either German or English.)',
                        answer: '',
                        right: '',
                        left: '',
                        component: null
                    },
                    fourth: {
                        question: 'How comprehensible did you find the blog post?',
                        answer: '',
                        right: 'Understandable',
                        left: 'Confusing',
                        component: true
                    },
                    fifth: {
                        question: 'How familiar were you with the topic before reading?',
                        answer: '',
                        right: 'Familiar',
                        left: 'Unfamiliar',
                        component: true
                    },
                    sixth: {
                        question: 'The text discusses Pasuckuakohowog, a large-scale team game played by the Algonquin people.',
                        answer: '',
                        right: 'Yes',
                        left: 'No',
                        component: false
                    },
                    seventh: {
                        question: 'The article mentions Tewaarathon, an Iroquois game that is a precursor to modern lacrosse.',
                        answer: '',
                        right: 'Yes',
                        left: 'No',
                        component: false
                    },
                    eight: {
                        question: 'The text highlights the Mayan Ball Game, emphasizing its ritualistic aspects and its role in the social and cosmic order.',
                        answer: '',
                        right: 'Yes',
                        left: 'No',
                        component: false
                    }
                }
            },
            'D': {
                'Pre': {
                    first: {
                        question: 'Can you explain how strategic planning can enhance the travel experience for a budget-conscious traveler? If you\'re unsure, please type "No". (Responses can be given in either German or English.)',
                        answer: '',
                        right: '',
                        left: '',
                        component: null
                    },
                    second: {
                        question: 'Have you ever planned a trip with a strict budget in mind, focusing on maximizing value before?',
                        answer: '',
                        right: 'Yes',
                        left: 'No',
                        component: false
                    },
                    third: {
                        question: 'How do you prioritize your spending when planning a trip to ensure you get the most out of your travel experience?',
                        answer: '',
                        right: 'Very strategically',
                        left: 'Not much consideration',
                        component: true
                    }
                },
                'Post': {
                    first: {
                        question: 'How useful did you find the text in providing answers?',
                        answer: '',
                        right: 'Helpful',
                        left: 'Unhelpful',
                        component: true
                    },
                    second: {
                        question: 'Do you find the text credible?',
                        answer: '',
                        right: 'Credible',
                        left: 'Not credible',
                        component: true
                    },
                    third:{
                        question: 'Explain why you think the blog article is credible. (Responses can be given in either German or English.)',
                        answer: '',
                        right: '',
                        left: '',
                        component: null
                    },
                    fourth: {
                        question: 'How comprehensible did you find the blog post?',
                        answer: '',
                        right: 'Understandable',
                        left: 'Confusing',
                        component: true
                    },
                    fifth: {
                        question: 'How familiar were you with the topic before reading?',
                        answer: '',
                        right: 'Familiar',
                        left: 'Unfamiliar',
                        component: true
                    },
                    sixth: {
                        question: 'The text discusses the importance of strategic destination selection to maximize travel value while staying within budget.',
                        answer: '',
                        right: 'Yes',
                        left: 'No',
                        component: false
                    },
                    seventh: {
                        question: 'The article highlights how monitoring currency exchange rates can offer significant savings for international travel.',
                        answer: '',
                        right: 'Yes',
                        left: 'No',
                        component: false
                    },
                    eight: {
                        question: 'Off-season travel is presented as a strategy to enjoy reduced costs and more authentic experiences, according to the text.',
                        answer: '',
                        right: 'Yes',
                        left: 'No',
                        component: false
                    }
                }
            },
            'General': {
                first: {
                    question: 'How would you rate your proficiency in English?',
                    answer: '',
                    right: 'Very good',
                    left: 'Very poor',
                    component: true
                },
                second: {
                    question: 'Do you regularly use English in your daily life?',
                    answer: '',
                    right: 'Yes',
                    left: 'No',
                    component: false
                },
                third: {
                    question: 'Is German your native language or are you fluent at a C1 level?',
                    answer: '',
                    right: 'Yes',
                    left: 'No',
                    component: false
                },
                fourth: {
                    question: 'How often do you read blog articles? (Choose what suits you best)',
                    answer: '',
                    right: 'Daily',
                    left: 'Never',
                    component: "drop_menu"
                },
            },
            'General_End': {
                first: {
                    question: 'How would you rate your proficiency in English?',
                    answer: '',
                    right: 'Very good',
                    left: 'Very poor',
                    component: true
                },
            },
        'Scenario':{
            'A':'You want to learn more about health and psychology because you have to give a presentation about it. You have come across the following blog article and would like to read it to see if it is relevant to your presentation.',
            'B':'You want to learn more about finance topics because you have to give a presentation about it. You have come across the following blog article and would like to read it to see if it is relevant to your presentation.',
            'C':'You want to learn more about the history of sports because you have to give a presentation about it. You have come across the following blog article and would like to read it to see if it is relevant to your presentation.',
            'D':'You want to learn  more about cheap travel tips because you have to give a presentation about it. You have come across the following blog article and would like to read it to see if it is relevant to your presentation.'
        }
    }

    return {
        'preOne':Questions[topic[0]]['Pre'],
        'preTwo':Questions[topic[1]]['Pre'],
        'preThree':Questions[topic[2]]['Pre'],
        'preFour':Questions[topic[3]]['Pre'],
        'postOne':Questions[topic[0]]['Post'],
        'postTwo':Questions[topic[1]]['Post'],
        'postThree':Questions[topic[2]]['Post'],
        'postFour':Questions[topic[3]]['Post'],
        'general':Questions['General'],
        'General_End':Questions['General_End'],
        'scenario_one':Questions['Scenario'][topic[0]],
        'scenario_two':Questions['Scenario'][topic[1]],
        'scenario_three':Questions['Scenario'][topic[2]],
        'scenario_four':Questions['Scenario'][topic[3]]
    }
}

export default GetData;