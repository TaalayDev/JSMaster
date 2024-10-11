import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:jsmaster/config/assets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../core.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About JS Master'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _AppLogo(),
              const SizedBox(height: 24),
              Text(
                'JS Master',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Version 1.0.0',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).hintColor,
                    ),
              ),
              const SizedBox(height: 24),
              const _FeatureList(),
              const SizedBox(height: 24),
              const _AboutDescription(),
              const SizedBox(height: 24),
              const _DeveloperInfo(),
            ],
          ),
        ),
      ),
    );
  }
}

class _AppLogo extends StatelessWidget {
  const _AppLogo();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          shape: BoxShape.circle,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(60),
          child: Image.asset(Assets.images.icLauncher),
        ),
      ),
    );
  }
}

class _FeatureList extends StatelessWidget {
  const _FeatureList();

  @override
  Widget build(BuildContext context) {
    final features = [
      'Interactive JavaScript lessons',
      'Real-time code execution',
      'Progress tracking',
      'Offline access to lessons',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Features',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        ...features.map((feature) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  Icon(Feather.check_circle,
                      color: Theme.of(context).colorScheme.primary, size: 20),
                  const SizedBox(width: 8),
                  Text(feature, style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            )),
      ],
    );
  }
}

class _AboutDescription extends StatelessWidget {
  const _AboutDescription();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About JS Master',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          'JS Master is your go-to app for learning JavaScript. With interactive lessons, real-time code execution, and progress tracking, mastering JavaScript has never been easier. Whether you\'re a beginner or looking to refine your skills, JS Master provides a comprehensive learning experience tailored to your needs.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}

class _DeveloperInfo extends StatelessWidget {
  const _DeveloperInfo();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Developed by',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage(
                'https://avatars.githubusercontent.com/u/62436240?s=400&u=17fa868323a89ceb0626cadd30074fece0f340f5&v=4',
              ),
              radius: 20,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'TaalayDev',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        OutlinedButton.icon(
          onPressed: () {
            launchUrlString('https://taalaydeb.github.io/');
          },
          icon: const Icon(Feather.globe),
          label: const Text('Visit Website'),
        ),
      ],
    );
  }
}
