/*
In this Function we get the condtion and the topic to order our Tasks
 */
/*
    Topic A <=> Health
    Topic B <=> X,y
    Topic C <=> x,y
    Topic D <=> X,y
     */

function Condition(condition) {
    let topic = condition['topic']
    let conn = condition['condition']
    let Questions = {
        // Text A => Health
        'A':{
            'deutsch_schwer':'https://online-credibility-study-platform-storage.fra1.digitaloceanspaces.com/texts/health/TextHealthSchwerDeutsch.pdf',
            'englisch_leicht':'https://online-credibility-study-platform-storage.fra1.digitaloceanspaces.com/texts/health/TextHealthLeichtEnglisch.pdf',
            'deutsch_leicht':'https://online-credibility-study-platform-storage.fra1.digitaloceanspaces.com/texts/health/TextHealthLeichtDeutsch.pdf',
            'englisch_schwer':'https://online-credibility-study-platform-storage.fra1.digitaloceanspaces.com/texts/health/TextHealthSchwerEnglisch.pdf'
        },
        // Text B => Finance
        'B': {
            'deutsch_schwer':'https://online-credibility-study-platform-storage.fra1.digitaloceanspaces.com/texts/finance/TextFinanceSchwerDeutsch.pdf',
            'englisch_leicht':'https://online-credibility-study-platform-storage.fra1.digitaloceanspaces.com/texts/finance/TextFinanceLeichtEnglisch.pdf',
            'deutsch_leicht':'https://online-credibility-study-platform-storage.fra1.digitaloceanspaces.com/texts/finance/TextFinanceLeichtDeutsch.pdf',
            'englisch_schwer':'https://online-credibility-study-platform-storage.fra1.digitaloceanspaces.com/texts/finance/TextFinanceSchwerEnglisch.pdf'
        },
        // Text C => Sports
        'C':{
            'deutsch_schwer':'https://online-credibility-study-platform-storage.fra1.digitaloceanspaces.com/texts/sports/TextSportSchwerDeutsch.pdf',
            'englisch_leicht':'https://online-credibility-study-platform-storage.fra1.digitaloceanspaces.com/texts/sports/TextSportLeichtEnglisch.pdf',
            'deutsch_leicht':'https://online-credibility-study-platform-storage.fra1.digitaloceanspaces.com/texts/sports/TextSportLeichtDeutsch.pdf',
            'englisch_schwer':'https://online-credibility-study-platform-storage.fra1.digitaloceanspaces.com/texts/sports/TextSportSchwerEnglisch.pdf'
        },
        // Text D => Travel
        'D':{
            'deutsch_schwer':'https://online-credibility-study-platform-storage.fra1.digitaloceanspaces.com/texts/travel/TextTravelSchwerDeutsch.pdf',
            'englisch_leicht':'https://online-credibility-study-platform-storage.fra1.digitaloceanspaces.com/texts/travel/TextTravelLeichtEnglisch.pdf',
            'deutsch_leicht':'https://online-credibility-study-platform-storage.fra1.digitaloceanspaces.com/texts/travel/TextTravelLeichtDeutsch.pdf',
            'englisch_schwer':'https://online-credibility-study-platform-storage.fra1.digitaloceanspaces.com/texts/travel/TextTravelSchwerEnglisch.pdf'
        }
    }

    return {
        'one':Questions[topic[0]][conn[0]],
        'two':Questions[topic[1]][conn[1]],
        'three':Questions[topic[2]][conn[2]],
        'four':Questions[topic[3]][conn[3]],
    }
}

export default Condition;