import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: double.infinity,
        child: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(color: Colors.black),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: ClipOval(
                      child: Image.network(
                        "https://papercallio-production.s3.amazonaws.com/uploads/user/avatar/45184/thumb_100_rullys.jpg",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Text(
                    "Rully Alves Guei",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  Text(
                    "BETA LAB",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "ID: 40028922",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
            buildItemMenu(
              "Pacotes BETA",
              Icons.memory,
            ),
            buildItemMenu(
              "Meu Tim",
              Icons.sim_card,
              Icons.exit_to_app,
            ),
            buildItemMenu(
              "Extrato de pontos",
              Icons.attach_money,
              Icons.exit_to_app,
            ),
            buildItemMenu(
              "Recarregue agora",
              Icons.attach_money,
              Icons.exit_to_app,
            ),
            buildItemMenu(
              "Configurações",
              Icons.view_agenda,
              Icons.exit_to_app,
            ),
            buildItemMenu(
              "Me ajuda",
              Icons.help_outline,
              Icons.exit_to_app,
            ),
            buildItemMenu(
              "Sair",
              Icons.exit_to_app,
            ),
          ],
        ),
      ),
    );
  }

  ListTile buildItemMenu(String title, IconData icon, [IconData trailing]) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: (trailing != null)
          ? Icon(
              trailing,
              size: 18,
              color: Colors.grey.withOpacity(0.7),
            )
          : null,
    );
  }
}
