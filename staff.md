---
layout: page
title: Who We Are
description: A listing of all the course staff members.
---

# Who We Are

For office hours, see the [Weekly Schedule](../schedule)

## Faculty

{% assign faculty = site.staffers | where: 'role', 'Faculty' %}
{% for staffer in faculty %}
{{ staffer }}
{% endfor %}

## PhD TA

{% assign phd_tas = site.staffers | where: 'role', 'PhD TA' %}
{% for staffer in phd_tas %}
{{ staffer }}
{% endfor %}

{% assign undergraduate_tas = site.staffers | where: 'role', 'Undergraduate TA' %}
{% assign num_undergraduate_tas = undergraduate_tas | size %}
{% if num_undergraduate_tas != 0 %}
## Undergraduate TAs

{% for staffer in undergraduate_tas %}
{{ staffer }}
{% endfor %}
{% endif %}
