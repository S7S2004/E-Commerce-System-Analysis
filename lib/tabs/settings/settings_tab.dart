import 'package:flutter/material.dart';
import '../../gen_l10n/app_localizations.dart';
import '../../auth/login_screen.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({Key? key}) : super(key: key);

  void _logout(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.settings,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 24),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.color_lens),
                  title: Text(
                    AppLocalizations.of(context)!.state,
                  ),
                  trailing: Switch(
                    value: false,
                    onChanged: (value) {
                      // TODO: Implement theme switching
                    },
                  ),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.language),
                  title: Text(
                    AppLocalizations.of(context)!.language,
                  ),
                  trailing: DropdownButton<String>(
                    value: 'en',
                    onChanged: (String? value) {
                      // TODO: Implement language switching
                    },
                    items: const [
                      DropdownMenuItem(
                        value: 'en',
                        child: Text('English'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Card(
            child: ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: Text(
                AppLocalizations.of(context)!.logout,
                style: const TextStyle(color: Colors.red),
              ),
              onTap: () => _logout(context),
            ),
          ),
        ],
      ),
    );
  }
}