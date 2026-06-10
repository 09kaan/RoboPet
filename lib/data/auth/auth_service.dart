import 'package:firebase_auth/firebase_auth.dart';
 
/// Thin wrapper over FirebaseAuth. Anonymous-first; supports later linking.
class AuthService {
  AuthService(this._auth);
  final FirebaseAuth _auth;
 
  User? get currentUser => _auth.currentUser;
  Stream<User?> authStateChanges() => _auth.authStateChanges();
 
  /// Ensures we always have a uid. Safe to call on every cold start.
  Future<User> ensureSignedIn() async {
    // Wait for Firebase to load the saved session from disk
    final existing = await _auth.authStateChanges().first;
    if (existing != null) return existing;
    
    // If truly no session exists, create a new anonymous one
    final cred = await _auth.signInAnonymously();
    return cred.user!;
  }
 
  /// Upgrade the anonymous account to a permanent one (Phase 2.x).
  Future<UserCredential> linkCredential(AuthCredential credential) {
    final user = _auth.currentUser;
    if (user == null) {
      throw StateError('No anonymous user to link.');
    }
    return user.linkWithCredential(credential);
  }
}
