# Firebase Limits Quick Reference

## Daily Limits (Free Spark Plan)

### Authentication
- **Verification requests**: 10,000/day
- **Custom token generations**: 1,000/day

### Firestore Database
- **Document reads**: 50,000/day
- **Document writes**: 20,000/day
- **Document deletes**: 20,000/day
- **Storage**: 1 GiB
- **Network egress**: 10 GiB/month

### Cloud Storage
- **Storage**: 5 GB
- **Downloads**: 1 GB/day
- **Uploads**: 20,000/day

### Cloud Functions
- **Invocations**: 125,000/month
- **GB-seconds**: 40,000/month
- **CPU-seconds**: 40,000/month

## Warning Thresholds

Monitor these percentages to avoid hitting limits:

- **75%** - Implement optimization strategies
- **85%** - Consider plan upgrade
- **90%** - Activate emergency procedures
- **95%** - Immediate action required

## Quick Actions When Approaching Limits

1. **Enable aggressive caching**
2. **Reduce real-time listeners**
3. **Batch database operations**
4. **Compress uploaded files**
5. **Upgrade to Blaze plan**

## Emergency Contacts

- **Firebase Support**: [Firebase Console Support](https://console.firebase.google.com)
- **Billing Issues**: [Google Cloud Billing Support](https://cloud.google.com/billing/docs/how-to/get-support)