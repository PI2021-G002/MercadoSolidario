# Generated by Django 4.0.4 on 2022-10-28 10:09

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Mercado', '0007_produtosolidario_codigo_solidario'),
    ]

    operations = [
        migrations.AddField(
            model_name='estoque',
            name='quantidade_saida',
            field=models.IntegerField(default=0),
        ),
    ]
